module "mailserver" {
  source = "git@github.com:nop-systems/tf-modules.git//base/fcos/stack?ref=fcos/v0.6.0"
  # source = "../../base/fcos/stack"

  fqdn      = var.fqdn
  desc      = "Mailserver"
  xo_tags   = var.xo_tags
  memory    = 2048
  cpu_cores = 2
  disk_size = 40

  butane_snippets = [
    templatefile("${path.module}/mailserver.bu", {
      ssh_authorized_keys = jsonencode(var.ssh_authorized_keys)
      fqdn                = var.fqdn
      public_fqdn         = var.public_fqdn
      service_fqdn        = var.service_fqdn
      trusted_proxies     = join("\", \"", var.trusted_proxies)
      authentik_host      = var.authentik_host
      authentik_version   = var.authentik_version
      stalwart_image      = var.stalwart_image
      mail_domain         = var.mail_domain
    })
  ]

  cloudflare_zone_id     = var.cloudflare_zone_id
  xo_sr_id               = var.xo_sr_id
  xo_network_id          = var.xo_network_id
  xo_template_id         = var.xo_template_id
  vault_url              = var.vault_url
  monitoring_ingress_url = var.monitoring_ingress_url
  root_ca_pem            = var.root_ca_pem
  matchbox_http_endpoint = var.matchbox_http_endpoint
  admin_pki_mount        = var.admin_pki_mount
  services               = [var.service_fqdn]
}

module "service_cname_record" {
  source  = "git@github.com:nop-systems/tf-modules.git//base/dns-record?ref=dns-record/v0.2.0"
  name    = var.service_fqdn
  type    = "CNAME"
  value   = var.fqdn
  zone_id = var.cloudflare_zone_id
}
