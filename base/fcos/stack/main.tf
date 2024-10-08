resource "macaddress" "mac" {
  prefix = [10, 144, 1]
}

module "domain" {
  source = "git@github.com:nop-systems/tf-modules.git//helpers/parse-domain?ref=parse-domain/v1.0.0"
  domain = var.fqdn
}

module "approle" {
  source                    = "git@github.com:nop-systems/tf-modules.git//base/approle?ref=approle/v0.1.2"
  fqdn                      = var.fqdn
  cnames                    = var.cnames
  services                  = var.services
  additional_token_policies = var.additional_token_policies
  wrapping_ttl              = "10m"
}

module "ignition" {
  source = "../ignition"

  approle_role_id           = module.approle.roleid
  approle_wrapped_secret_id = module.approle.secretid
  butane_snippets           = var.butane_snippets
  fqdn                      = var.fqdn
  cnames                    = var.cnames
  services                  = var.services
  root_ca_pem               = var.root_ca_pem
  vault_url                 = var.vault_url
  admin_pki_mount           = var.admin_pki_mount
  monitoring_ingress_url    = var.monitoring_ingress_url
}

module "matchbox" {
  source = "../matchbox"

  fqdn                   = var.fqdn
  ignition               = module.ignition.ignition
  mac_address            = macaddress.mac.address
  matchbox_http_endpoint = var.matchbox_http_endpoint
}

module "vm" {
  source = "../vm"

  name = module.domain.record_name
  desc = var.desc
  tags = concat(var.xo_tags, module.ignition.xo_tags)

  cpu_cores = var.cpu_cores
  memory    = var.memory

  sr_id     = var.xo_sr_id
  disk_size = var.disk_size

  network_id  = var.xo_network_id
  mac_address = macaddress.mac.address

  template_id = var.xo_template_id
}

locals {
  # filter out link-local
  ipv6_addresses = [for ip in module.vm.ipv6_addresses : ip if !startswith(ip, "fe80")]
}

module "dns-record_A" {
  source = "git@github.com:nop-systems/tf-modules.git//base/dns-record?ref=dns-record/v0.2.0"

  name  = module.domain.record_name
  type  = "A"
  value = try(module.vm.ipv4_addresses[0], null)

  zone_id = var.cloudflare_zone_id
}

module "dns-record_AAAA" {
  source = "git@github.com:nop-systems/tf-modules.git//base/dns-record?ref=dns-record/v0.2.0"

  name  = module.domain.record_name
  type  = "AAAA"
  value = try(local.ipv6_addresses[0], null)

  zone_id = var.cloudflare_zone_id
}
