module "pretix" {
  source = "git@github.com:nop-systems/tf-modules.git//base/fcos/stack?ref=fcos/v0.6.0"
  # source = "../../base/fcos/stack"

  fqdn      = var.fqdn
  desc      = "Pretix"
  xo_tags   = var.xo_tags
  memory    = 4096
  cpu_cores = 4
  disk_size = 40

  butane_snippets = [
    templatefile("${path.module}/pretix.bu", {
      ssh_authorized_keys = jsonencode(var.ssh_authorized_keys)
      fqdn                = var.fqdn
      public_fqdn         = var.public_fqdn
      service_fqdn        = var.service_fqdn
      instance_name       = var.instance_name
      mail_from           = var.mail_from
      language            = var.language
      timezone            = var.timezone
      currency            = var.currency
      # https://hub.docker.com/r/pretix/standalone
      pretix_image = "docker.io/pretix/standalone:2024.9"
      # https://hub.docker.com/_/postgres
      postgres_image = "docker.io/library/postgres:16-alpine"
      # https://hub.docker.com/r/valkey/valkey
      valkey_image = "docker.io/valkey/valkey:7.2.6"
    }),
    templatefile("${path.module}/caddy.bu", {
      fqdn            = var.fqdn
      acme_ca         = var.acme_ca
      trusted_proxies = join(" ", var.trusted_proxies)
      service_fqdn    = var.service_fqdn
      # https://hub.docker.com/_/caddy
      caddy_image = "docker.io/library/caddy:2.8"
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
