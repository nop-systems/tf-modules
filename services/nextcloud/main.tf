module "fcos" {
  source = "git@github.com:nop-systems/tf-modules.git//base/fcos/stack?ref=fcos/v0.5.4"
  # source = "../../base/fcos/stack"

  fqdn      = var.fqdn
  desc      = "Nextcloud file sharing and collaboration platform"
  xo_tags   = concat(var.xo_tags, ["service:nextcloud"])
  memory    = 1024 * 4
  cpu_cores = 4
  disk_size = 500

  butane_snippets = [
    templatefile("${path.module}/nextcloud.bu", {
      fqdn                   = var.fqdn
      nextcloud_public_fqdn  = var.nextcloud_public_fqdn
      nextcloud_service_fqdn = var.nextcloud_service_fqdn
      php_memory_limit       = var.php_memory_limit
      php_upload_limit       = var.php_upload_limit
      nextcloud_fpm_version  = "29.0.4-fpm"
      postgres_version       = "16-alpine"
      valkey_version         = "7.2.6"
    }),
    templatefile("${path.module}/caddy.bu", {
      fqdn                   = var.fqdn
      acme_ca                = var.acme_ca
      trusted_proxies        = join(" ", var.trusted_proxies)
      nextcloud_service_fqdn = var.nextcloud_service_fqdn
      collabora_service_fqdn = var.collabora_service_fqdn
      caddy_version          = "2.8"
    }),
    templatefile("${path.module}/collabora.bu", {
      collabora_public_fqdn  = var.collabora_public_fqdn
      nextcloud_public_fqdn  = var.nextcloud_public_fqdn
      collabora_code_version = "24.04.6.1.1"
    })
  ]

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
