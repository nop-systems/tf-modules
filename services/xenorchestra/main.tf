module "fcos" {
  source = "git@github.com:nop-systems/tf-modules.git//base/fcos/stack?ref=fcos/v0.2.6"
  # source = "../../base/fcos/stack"

  fqdn      = var.fqdn
  desc      = "Xen Orchestra (Community Edition)"
  xo_tags   = concat(var.xo_tags, ["xenorchestra"])
  memory    = 2048
  cpu_cores = 2
  disk_size = 30

  butane_snippets = [templatefile("${path.module}/xenorchestra.bu", {
    fqdn              = var.fqdn
    service_fqdn      = var.service_fqdn
    authentik_version = "2024.6.0"
    authentik_host    = var.authentik_host
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

