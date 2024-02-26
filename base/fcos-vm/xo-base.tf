data "xenorchestra_pool" "pool" {
  name_label = "eadrax.nop.systems"
}

data "xenorchestra_template" "fcos" {
  name_label = "FCOS_disk"
}

data "xenorchestra_network" "guests" {
  name_label = "guests"
}

data "xenorchestra_network" "xen_mgmt" {
  name_label = "xen-mgmt"
}

data "xenorchestra_network" "host" {
  name_label = "eth0"
}

data "xenorchestra_network" "mgmt" {
  name_label = "mgmt"
}

data "xenorchestra_sr" "local" {
  name_label = "Local storage"
}
