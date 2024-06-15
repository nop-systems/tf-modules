module "fcos" {
  source = "git@github.com:nop-systems/tf-modules.git//base/fcos/stack?ref=fcos/v0.1.1"
  #source = "../../base/fcos/stack"

  fqdn      = var.fqdn
  desc      = "HashiCorp Vault Node ${var.fqdn}"
  xo_tags   = var.xo_tags
  memory    = 4069
  cpu_cores = 2
  disk_size = 100

  cloudflare_zone_id     = var.cloudflare_zone_id
  xo_sr_id               = var.xo_sr_id
  xo_network_id          = var.xo_network_id
  xo_template_id         = var.xo_template_id
  vault_url              = var.vault_url
  root_ca_pem            = var.root_ca_pem
  matchbox_http_endpoint = var.matchbox_http_endpoint

  butane_snippets = [templatefile("${path.module}/vault.bu", {
    fqdn                  = var.fqdn
    ssh_authorized_keys   = jsonencode(var.ssh_authorized_keys)
    cloudflare_zone_id    = var.cloudflare_zone_id
    cluster_fqdn          = var.cluster_fqdn
    cluster_members_fqdns = var.cluster_members_fqdns
    acme_email            = var.acme_email
  })]
}
