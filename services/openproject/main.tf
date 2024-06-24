module "fcos" {
  source = "git@github.com:nop-systems/tf-modules.git//base/fcos/stack?ref=fcos/v0.2.6"
  # source = "../../base/fcos/stack"

  fqdn      = var.fqdn
  desc      = "OpnepProject project managing software"
  xo_tags   = concat(var.xo_tags, ["service:openproject"])
  memory    = 1024 * 4
  cpu_cores = 4
  disk_size = 40

  butane_snippets = [templatefile("${path.module}/openproject.bu", {
    acme_ca          = var.acme_ca
    fqdn             = var.fqdn
    service_fqdn     = var.service_fqdn
    public_fqdn      = var.public_fqdn
    default_language = var.default_language
    trusted_proxies  = join(" ", var.trusted_proxies)
    authentik_host   = var.authentik_host
  })]

  cloudflare_zone_id     = var.cloudflare_zone_id
  xo_sr_id               = var.xo_sr_id
  xo_network_id          = var.xo_network_id
  xo_template_id         = var.xo_template_id
  vault_url              = var.vault_url
  root_ca_pem            = var.root_ca_pem
  matchbox_http_endpoint = var.matchbox_http_endpoint
  services               = [var.service_fqdn]
}

module "service_cname_record" {
  source  = "git@github.com:nop-systems/tf-modules.git//base/dns-record?ref=dns-record/v0.1.0"
  name    = var.service_fqdn       # DNS record name
  type    = "CNAME"                # record type (e.g. A, AAAA)
  value   = var.fqdn               # record value (e.g. IP address)
  zone_id = var.cloudflare_zone_id # Cloudflare Zone ID
}

