module "fcos" {
  source = "git@github.com:nop-systems/tf-modules.git//base/fcos/stack?ref=fcos/v0.6.4"
  # source = "../../base/fcos/stack"

  fqdn      = var.fqdn
  desc      = "authentik"
  xo_tags   = concat(var.xo_tags, ["authentik"])
  memory    = 4096
  cpu_cores = 4
  disk_size = 100

  butane_snippets = [templatefile("${path.module}/authentik.bu", {
    service_fqdn        = var.service_fqdn
    trusted_proxy_cidrs = var.trusted_proxy_cidrs
    authentik_version   = "2025.2.2"
  })]

  cloudflare_zone_id     = var.cloudflare_zone_id
  xo_sr_id               = var.xo_sr_id
  xo_network_id          = var.xo_network_id
  xo_template_id         = var.xo_template_id
  vault_url              = var.vault_url
  root_ca_pem            = var.root_ca_pem
  admin_pki_mount        = var.admin_pki_mount
  matchbox_http_endpoint = var.matchbox_http_endpoint
  services               = [var.service_fqdn]
  monitoring_ingress_url = var.monitoring_ingress_url
}

module "service_cname_record" {
  source  = "git@github.com:nop-systems/tf-modules.git//base/dns-record?ref=dns-record/v0.2.0"
  name    = var.service_fqdn       # DNS record name
  type    = "CNAME"                # record type (e.g. A, AAAA)
  value   = var.fqdn               # record value (e.g. IP address)
  zone_id = var.cloudflare_zone_id # Cloudflare Zone ID
}
