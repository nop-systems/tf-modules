module "hello-world" {
  #source = "git@github.com:nop-systems/tf-modules.git//base/fcos/stack?ref=fcos/v0.7.0"
  source = "../../base/fcos/stack"

  fqdn      = var.fqdn
  desc      = "hello world"
  xo_tags   = var.xo_tags
  memory    = 3072
  cpu_cores = 1
  disk_size = 10

  butane_snippets = [templatefile("${path.module}/hello-world.bu", {
    ssh_authorized_keys = jsonencode(var.ssh_authorized_keys)
    fqdn                = var.fqdn
    acme_url            = var.acme_url
  })]

  cloudflare_zone_id     = var.cloudflare_zone_id
  xo_sr_id               = var.xo_sr_id
  xo_network_id          = var.xo_network_id
  xo_template_id         = var.xo_template_id
  vault_url              = var.vault_url
  admin_pki_mount        = var.admin_pki_mount
  root_ca_pem            = var.root_ca_pem
  matchbox_http_endpoint = var.matchbox_http_endpoint
  monitoring_ingress_url = var.monitoring_ingress_url
}
