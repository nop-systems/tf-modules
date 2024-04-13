resource "xenorchestra_vm" "this" {
  memory_max        = var.memory * pow(1024, 2)
  cpus              = var.cpu_cores
  name_label        = var.name
  name_description  = var.desc
  hvm_boot_firmware = "uefi"
  template          = var.template_id
  auto_poweron      = true
  wait_for_ip       = true

  affinity_host = var.affinity_host_id

  network {
    network_id  = var.network_id
    mac_address = var.mac_address
  }

  disk {
    sr_id      = var.sr_id
    name_label = "${var.name}_root"
    size       = 10 * pow(1024, 3)
  }

  disk {
    sr_id      = var.sr_id
    name_label = "${var.name}_var"
    size       = var.disk_size * pow(1024, 3)
  }

  tags = concat([
    "os:FedoraCoreOS",
    "managed-by:Terraform"
  ], var.tags)

  timeouts {
    create = "10m"
  }
}