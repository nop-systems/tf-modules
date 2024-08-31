module "fcos" {
  source = "git@github.com:nop-systems/tf-modules.git//base/fcos/stack?ref=fcos/v0.5.5"
  # source = "../../base/fcos/stack"

  fqdn      = var.fqdn
  desc      = "Nextcloud file sharing and collaboration platform"
  xo_tags   = concat(var.xo_tags, ["service:nextcloud"])
  memory    = 1024 * 8
  cpu_cores = 4
  disk_size = 500

  butane_snippets = [
    templatefile("${path.module}/nextcloud.bu", {
      fqdn                    = var.fqdn
      nextcloud_public_fqdn   = var.nextcloud_public_fqdn
      nextcloud_service_fqdn  = var.nextcloud_service_fqdn
      upload_limit            = var.upload_limit
      php_apc_shm_size        = var.php_apc_shm_size
      php_opcache_memory_size = var.php_opcache_memory_size
      php_memory_limit        = var.php_memory_limit

      default_language     = var.default_language
      default_locale       = var.default_locale
      default_phone_region = var.default_phone_region
      default_timezone     = var.default_timezone

      hide_login_form    = var.hide_login_form
      lost_password_link = var.lost_password_link

      nextcloud_version = "29.0.5" # https://github.com/hoellen/docker-nextcloud/pkgs/container/nextcloud
      postgres_version  = "16-alpine"
      valkey_version    = "7.2.6"
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
      collabora_service_fqdn = var.collabora_service_fqdn
      nextcloud_public_fqdn  = var.nextcloud_public_fqdn
      collabora_code_version = "24.04.6.2.1"
    }),
    file("${path.module}/helper-services.bu"),
  ]

  cloudflare_zone_id     = var.cloudflare_zone_id
  xo_sr_id               = var.xo_sr_id
  xo_network_id          = var.xo_network_id
  xo_template_id         = var.xo_template_id
  vault_url              = var.vault_url
  root_ca_pem            = var.root_ca_pem
  matchbox_http_endpoint = var.matchbox_http_endpoint
  admin_pki_mount        = var.admin_pki_mount
  services               = [var.nextcloud_service_fqdn, var.collabora_service_fqdn]
}

module "nextcloud_service_cname_record" {
  source  = "git@github.com:nop-systems/tf-modules.git//base/dns-record?ref=dns-record/v0.2.0"
  name    = var.nextcloud_service_fqdn
  type    = "CNAME"
  value   = var.fqdn
  zone_id = var.cloudflare_zone_id
}

module "collabora_service_cname_record" {
  source  = "git@github.com:nop-systems/tf-modules.git//base/dns-record?ref=dns-record/v0.2.0"
  name    = var.collabora_service_fqdn
  type    = "CNAME"
  value   = var.fqdn
  zone_id = var.cloudflare_zone_id
}
