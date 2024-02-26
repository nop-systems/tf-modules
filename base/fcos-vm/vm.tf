resource "xenorchestra_vm" "vm" {
  memory_max        = var.memory * pow(1024, 2)
  cpus              = var.cpu_cores
  name_label        = var.name
  name_description  = var.desc
  hvm_boot_firmware = "uefi"
  template          = data.xenorchestra_template.fcos.id
  auto_poweron      = true
  wait_for_ip       = true

  # Prefer to run the VM on the primary pool instance
  affinity_host = data.xenorchestra_pool.pool.master
  network {
    network_id  = data.xenorchestra_network.guests.id
    mac_address = macaddress.mac.address
  }

  disk {
    sr_id      = data.xenorchestra_sr.local.id
    name_label = "${var.name}_root"
    size       = 10 * pow(1024, 3)
  }

  disk {
    sr_id      = data.xenorchestra_sr.local.id
    name_label = "${var.name}_var"
    size       = var.disk_size * pow(1024, 3)
  }

  tags = [
    "Fedora CoreOS",
    "Terraform"
  ]

  timeouts {
    create = "10m"
  }

  depends_on = [matchbox_profile.fedora-coreos-install]
}

resource "macaddress" "mac" {
  prefix = [10, 144, 1]
}

locals {
  globals  = yamldecode(file("${path.root}/tfglobals.yaml"))
  matchbox = provider.matchbox.endpoint
}

resource "matchbox_group" "mapbymac" {
  name    = var.name
  profile = matchbox_profile.fedora-coreos-install.name
  selector = {
    mac = macaddress.mac.address
  }
}

// Fedora CoreOS profile
resource "matchbox_profile" "fedora-coreos-install" {
  name   = var.name
  kernel = "https://builds.coreos.fedoraproject.org/prod/streams/${var.fcos_stream}/builds/${var.fcos_version != null ? var.fcos_version : local.fcos_latest}/x86_64/fedora-coreos-${var.fcos_version != null ? var.fcos_version : local.fcos_latest}-live-kernel-x86_64"

  initrd = [
    "--name main https://builds.coreos.fedoraproject.org/prod/streams/${var.fcos_stream}/builds/${var.fcos_version != null ? var.fcos_version : local.fcos_latest}/x86_64/fedora-coreos-${var.fcos_version != null ? var.fcos_version : local.fcos_latest}-live-initramfs.x86_64.img"
  ]

  args = [
    "initrd=main",
    "coreos.live.rootfs_url=https://builds.coreos.fedoraproject.org/prod/streams/${var.fcos_stream}/builds/${var.fcos_version != null ? var.fcos_version : local.fcos_latest}/x86_64/fedora-coreos-${var.fcos_version != null ? var.fcos_version : local.fcos_latest}-live-rootfs.x86_64.img",
    "coreos.inst.install_dev=/dev/xvda",
    "coreos.inst.ignition_url=${local.globals.matchbox_http_endpoint}/ignition?uuid=$${uuid}&mac=$${mac:hexhyp}"
  ]

  # mark as sensitive to reduce long plan output
  raw_ignition = sensitive(data.ct_config.fcos.rendered)
}


data "ct_config" "fcos" {
  content = sensitive(var.butane)
  strict  = true
  snippets = sensitive([
    templatefile("${path.module}/templates/base.bu.tftpl", {
      hostname            = var.name
      ssh_authorized_keys = var.ssh_authorized_keys
    }),
    templatefile("${path.module}/templates/vault-agent.bu.tftpl", {
      vault_roleid           = module.approle.roleid
      vault_wrapped_secretid = module.approle.secretid
      vault_version          = var.vault_version
    }),
    templatefile("${path.module}/templates/ssh.bu.tftpl", {
      vault-ssh-cli_version = var.vault-ssh-cli_version
      fqdn                  = "${var.name}.guests.nop.systems"
    }),
    templatefile("${path.module}/templates/pki.bu.tftpl", {
      fqdn = "${var.name}.guests.nop.systems"
    })
  ])
  # pretty_print = true
}

module "approle" {
  source   = "../approle"
  app_name = var.name
}

output "ipv4_server" {
  description = "IPv4 of VM"
  value       = xenorchestra_vm.vm.ipv4_addresses
}

output "ipv6_server" {
  description = "IPv6 of VM"
  value       = xenorchestra_vm.vm.ipv6_addresses
}

output "ignition" {
  description = "Ignition config"
  value       = data.ct_config.fcos.rendered
}

module "dns_record" {
  source = "../dns-record"

  record_name = "${var.name}.guests"
  records = {
    A = {
      type  = "A"
      value = (length(xenorchestra_vm.vm.network[0].ipv4_addresses) > 0) ? xenorchestra_vm.vm.network[0].ipv4_addresses[0] : null
    }
    AAAA = {
      type = "AAAA"
    value = (length(xenorchestra_vm.vm.network[0].ipv6_addresses) > 0) ? xenorchestra_vm.vm.network[0].ipv6_addresses[0] : null }
  }
}

output "fqdn" {
  description = "FQDN of VM"
  value       = module.dns_record.fqdn
}
