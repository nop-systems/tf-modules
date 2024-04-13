module "hello-world" {
  source = "git@github.com:nop-systems/terraform-modules.git//base/fcos/stack?ref=fcos/v0.1.0"
  # source = "../../base/fcos/stack"

  fqdn      = var.fqdn
  desc      = "hello world"
  xo_tags   = var.xo_tags
  memory    = 2048
  cpu_cores = 1
  disk_size = 10

  butane_snippets = [file("${path.module}/hello-world.bu")]

  cloudflare_zone_id     = var.cloudflare_zone_id
  xo_sr_id               = var.xo_sr_id
  xo_network_id          = var.xo_network_id
  xo_template_id         = var.xo_template_id
  vault_url              = var.vault_url
  root_ca_pem            = var.root_ca_pem
  matchbox_http_endpoint = var.matchbox_http_endpoint
}

