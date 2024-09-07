locals {
  upload_limit_bytes = var.upload_limit_GB * pow(10, 9)
  nextcloud_config = {
    system = {
      "upgrade.disable-web" = true
      trusted_domains = [
        var.fqdn,
        var.nextcloud_public_fqdn,
        var.nextcloud_service_fqdn
      ]
      trusted_proxies               = ["0.0.0.0/0", "::/0"]
      log_type                      = "syslog"
      syslog_tag                    = "nextcloud"
      logfile                       = ""
      loglevel                      = 2
      log_type_audit                = "syslog"
      syslog_tag_audit              = "nextcloud_audit"
      logfile_audit                 = ""
      default_language              = var.default_language
      default_locale                = var.default_locale
      default_phone_region          = var.default_phone_region
      default_timezone              = var.default_timezone
      trashbin_retention_obligation = "auto, 90"
      maintenance_window_start      = 3
      overwriteprotocol             = "https"
      "overwrite.cli.url"           = "https://${var.nextcloud_public_fqdn}"
      enabledPreviewProviders = [
        "OC\\Preview\\MP3",
        "OC\\Preview\\TXT",
        "OC\\Preview\\MarkDown",
        "OC\\Preview\\OpenDocument",
        "OC\\Preview\\Krita",
        "OC\\Preview\\Imaginary"
      ]
      preview_imaginary_url  = "http://systemd-imaginary:9000/"
      preview_format         = "webp"
      "memcache.local"       = "\\OC\\Memcache\\APCu"
      "memcache.distributed" = "\\OC\\Memcache\\Redis"
      "memcache.locking"     = "\\OC\\Memcache\\Redis"
      redis = {
        host = "systemd-valkey"
        port = 6379
      }
    }
    apps = {
      richdocuments = {
        enabled         = "yes"
        types           = "prevent_group_restriction"
        wopi_url        = "http://systemd-collabora:9980"
        public_wopi_url = "https://${var.collabora_public_fqdn}"
        wopi_allowlist  = "10.89.0.0/16,fd00::/8"
      }
      files_antivirus = {
        enabled              = "yes"
        av_mode              = "daemon"
        av_host              = "systemd-clamav"
        av_port              = "3310"
        av_infected_action   = "only_log"
        av_stream_max_length = local.upload_limit_bytes
        av_max_file_size     = "-1"
        av_scan_first_bytes  = "-1"
        types                = "filesystem,dav"
      }
      logreader = {
        enabled = "no"
      }
      admin_audit = {
        enabled = "yes"
      }
      firstrunwizard = {
        enabled = "no"
      }
      survey_client = {
        enabled = "no"
      }
    }
  }
}

module "fcos" {
  source = "git@github.com:nop-systems/tf-modules.git//base/fcos/stack?ref=fcos/v0.6.0"
  # source = "../../base/fcos/stack"

  fqdn      = var.fqdn
  desc      = "Nextcloud file sharing and collaboration platform"
  xo_tags   = concat(var.xo_tags, ["service=nextcloud"])
  memory    = 1024 * 8
  cpu_cores = 4
  disk_size = 500

  butane_snippets = [
    templatefile("${path.module}/nextcloud.bu", {
      fqdn                    = var.fqdn
      nextcloud_public_fqdn   = var.nextcloud_public_fqdn
      nextcloud_service_fqdn  = var.nextcloud_service_fqdn
      collabora_public_fqdn   = var.collabora_public_fqdn
      upload_limit_bytes      = local.upload_limit_bytes
      php_apc_shm_size        = var.php_apc_shm_size
      php_opcache_memory_size = var.php_opcache_memory_size
      php_memory_limit        = var.php_memory_limit

      apps             = join(" ", toset(concat(["files_antivirus", "richdocuments"], var.apps)))
      nextcloud_config = jsonencode(local.nextcloud_config)
      # merge into default object because occ complains about empty object
      nextcloud_custom_config = jsonencode(merge({ system = {} }, var.config))

      # https://github.com/hoellen/docker-nextcloud/pkgs/container/nextcloud
      nextcloud_version = "29.0.5"
      # https://hub.docker.com/_/postgres/tags
      postgres_version = "16-alpine"
      # https://hub.docker.com/r/valkey/valkey/tags
      valkey_version = "7.2.6"
    }),
    templatefile("${path.module}/caddy.bu", {
      fqdn                   = var.fqdn
      acme_ca                = var.acme_ca
      trusted_proxies        = join(" ", var.trusted_proxies)
      nextcloud_service_fqdn = var.nextcloud_service_fqdn
      collabora_service_fqdn = var.collabora_service_fqdn
      # https://hub.docker.com/_/caddy/tags
      caddy_version = "2.8"
    }),
    templatefile("${path.module}/collabora.bu", {
      fqdn                   = var.fqdn
      collabora_public_fqdn  = var.collabora_public_fqdn
      collabora_service_fqdn = var.collabora_service_fqdn
      nextcloud_public_fqdn  = var.nextcloud_public_fqdn
      nextcloud_service_fqdn = var.nextcloud_service_fqdn
      # https://hub.docker.com/r/collabora/code/tags
      collabora_code_version = "24.04.7.1.2"
      # https://hub.docker.com/r/elestio/languagetool/tags
      languagetool_version = "v6.4"
    }),
    templatefile("${path.module}/helper-services.bu", {
      upload_limit_bytes     = local.upload_limit_bytes
      nextcloud_service_fqdn = var.nextcloud_service_fqdn
      authentik_host         = var.authentik_host
      # https://github.com/goauthentik/authentik/pkgs/container/ldap
      authentik_version = "2024.8"
    }),
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
