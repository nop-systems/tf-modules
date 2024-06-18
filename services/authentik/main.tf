module "fcos" {
  source = "git@github.com:nop-systems/tf-modules.git//base/fcos/stack?ref=fcos/v0.2.4"
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

