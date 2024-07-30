locals {
  cluster_node_fqdn = "${var.node}.${var.cluster_fqdn}"
}

module "fcos" {
  source = "git@github.com:nop-systems/tf-modules.git//base/fcos/stack?ref=fcos/v0.5.4"
  #source = "../../base/fcos/stack"

  fqdn      = var.fqdn
  desc      = "HashiCorp Vault Node ${var.node}"
  xo_tags   = concat(var.xo_tags, ["vault"])
  memory    = 4069
  cpu_cores = 2
  disk_size = 100

  cloudflare_zone_id     = var.cloudflare_zone_id
  xo_sr_id               = var.xo_sr_id
  xo_network_id          = var.xo_network_id
  xo_template_id         = var.xo_template_id
  vault_url              = var.vault_url
  root_ca_pem            = var.root_ca_pem
  admin_pki_mount        = var.admin_pki_mount
  matchbox_http_endpoint = var.matchbox_http_endpoint
  services               = [var.cluster_fqdn]
  cnames                 = [local.cluster_node_fqdn]

  butane_snippets = [templatefile("${path.module}/vault.bu", {
    fqdn                = var.fqdn
    ssh_authorized_keys = jsonencode(var.ssh_authorized_keys)
    cloudflare_zone_id  = var.cloudflare_zone_id
    cluster_fqdn        = var.cluster_fqdn
    cluster_node_fqdn   = local.cluster_node_fqdn
    cluster_members     = var.cluster_members
    acme_email          = var.acme_email
  })]
}

module "cluster_node_cname" {
  source  = "git@github.com:nop-systems/tf-modules.git//base/dns-record?ref=dns-record/v0.1.0"
  name    = local.cluster_node_fqdn # DNS record name
  type    = "CNAME"                 # record type (e.g. A, AAAA)
  value   = var.fqdn                # record value (e.g. IP address)
  zone_id = var.cloudflare_zone_id  # Cloudflare Zone ID
}

module "cluster_A_record" {
  source  = "git@github.com:nop-systems/tf-modules.git//base/dns-record?ref=dns-record/v0.1.0"
  name    = var.cluster_fqdn                         # DNS record name
  type    = "A"                                      # record type (e.g. A, AAAA)
  value   = try(module.fcos.ipv4_addresses[0], null) # record value (e.g. IP address)
  zone_id = var.cloudflare_zone_id                   # Cloudflare Zone ID
}

module "cluster_AAAA_record" {
  source  = "git@github.com:nop-systems/tf-modules.git//base/dns-record?ref=dns-record/v0.1.0"
  name    = var.cluster_fqdn
  type    = "AAAA"
  value   = try([for ip in module.fcos.ipv6_addresses : ip if !startswith(ip, "fe80")][0], null)
  zone_id = var.cloudflare_zone_id
}
