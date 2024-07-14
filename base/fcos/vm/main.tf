resource "xenorchestra_vm" "this" {
  memory_max        = var.memory * pow(1024, 2)
  cpus              = var.cpu_cores
  name_label        = var.name
  name_description  = var.desc
  hvm_boot_firmware = "uefi"
  template          = var.template_id
  auto_poweron      = true

  affinity_host = var.affinity_host_id

  network {
    network_id       = var.network_id
    mac_address      = var.mac_address
    expected_ip_cidr = "0.0.0.0/0"
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
    "managed-by=Terraform"
  ], var.tags)

  timeouts {
    create = "10m"
  }

  # https://github.com/vatesfr/terraform-provider-xenorchestra/issues/318
  # blocked_operations = var.protect_vm ? [
  #   "clean_reboot",
  #   "clean_shutdown",
  #   "destroy",
  #   "hard_reboot",
  #   "hard_shutdown",
  #   "pause",
  #   "shutdown",
  #   "suspend",
  # ] : []

}
