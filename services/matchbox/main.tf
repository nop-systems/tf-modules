module "fcos" {
  source = "git@github.com:nop-systems/tf-modules.git//base/fcos/stack?ref=fcos/v0.5.3"
  # source = "../../base/fcos/stack"

  fqdn      = var.fqdn
  desc      = "matchbox"
  xo_tags   = var.xo_tags
  memory    = 2048
  cpu_cores = 1
  disk_size = 20

  butane_snippets = [templatefile("${path.module}/matchbox.bu", {
    fqdn                 = var.fqdn
    download_fcos_script = jsonencode(file("${path.module}/download_fcos.sh"))
  })]

  cloudflare_zone_id     = var.cloudflare_zone_id
  xo_sr_id               = var.xo_sr_id
  xo_network_id          = var.xo_network_id
  xo_template_id         = var.xo_template_id
  vault_url              = var.vault_url
  root_ca_pem            = var.root_ca_pem
  matchbox_http_endpoint = var.matchbox_http_endpoint
  admin_pki_mount        = var.admin_pki_mount
  cnames                 = [var.internal_fqdn]
  services               = [var.service_fqdn]
}
