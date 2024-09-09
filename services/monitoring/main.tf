locals {
  services = ["loki", "prometheus", "grafana", "alertmanager", "ingress"]
  cnames   = [for name in local.services : "${name}.${var.fqdn}"]
  internal_fqdns = [
    var.grafana_fqdn, var.loki_fqdn, var.prometheus_fqdn,
    var.alertmanager_fqdn, var.ingress_fqdn
  ]
}

module "fcos" {
  source = "git@github.com:nop-systems/tf-modules.git//base/fcos/stack?ref=fcos/v0.6.0"

  fqdn      = var.fqdn
  desc      = "Monitoring Stack"
  xo_tags   = concat(var.xo_tags, ["service=monitoring"])
  memory    = 1024 * 4
  cpu_cores = 4
  disk_size = 50

  butane_snippets = [
    templatefile("${path.module}/prometheus.bu", {
      service_fqdn = var.service_fqdn
      # https://quay.io/repository/prometheus/prometheus?tab=tags
      prometheus_image = "quay.io/prometheus/prometheus:v2.54.1"
      # https://quay.io/repository/prometheus/alertmanager?tab=tags
      alertmanager_image = "quay.io/prometheus/alertmanager:v0.27.0"
      # https://quay.io/repository/prometheus/blackbox-exporter?tab=tags
      blackbox_exporter_image = "quay.io/prometheus/blackbox-exporter:v0.25.0"
      # https://quay.io/repository/prometheus/snmp-exporter?tab=tags
      snmp_exporter_image = "quay.io/prometheus/snmp-exporter:v0.26.0"
      # https://github.com/nop-systems/xo-sd-proxy/pkgs/container/xo-sd-proxy
      xo_sd_proxy_image = "ghcr.io/nop-systems/xo-sd-proxy:v0.1.0"
    }),
    templatefile("${path.module}/grafana.bu", {
      grafana_fqdn = var.grafana_fqdn
      # https://hub.docker.com/r/grafana/grafana-image-renderer/tags
      grafana_image_renderer_image = "docker.io/grafana/grafana-image-renderer:latest"
      # https://hub.docker.com/r/grafana/grafana-oss/tags
      grafana_image = "docker.io/grafana/grafana-oss:11.2.0"
      service_fqdn  = var.service_fqdn
    }),
    templatefile("${path.module}/loki.bu", {
      # https://github.com/grafana/loki/releases
      loki_image = "docker.io/grafana/loki:3.1.1"
      # https://hub.docker.com/r/minio/minio/tags
      minio_image  = "docker.io/minio/minio:RELEASE.2024-08-29T01-40-52Z"
      service_fqdn = var.service_fqdn
    }),
    templatefile("${path.module}/caddy.bu", {
      acme_ca           = var.acme_ca
      admin_pki_mount   = var.admin_pki_mount
      alertmanager_fqdn = var.alertmanager_fqdn
      # https://hub.docker.com/_/caddy
      caddy_image     = "docker.io/library/caddy:2.8"
      fqdn            = var.fqdn
      grafana_fqdn    = var.grafana_fqdn
      ingress_fqdn    = var.ingress_fqdn
      loki_fqdn       = var.loki_fqdn
      prometheus_fqdn = var.prometheus_fqdn
      service_fqdn    = var.service_fqdn
      trusted_proxies = join(" ", var.trusted_proxies)
    })
  ]

  monitoring_ingress_url = var.ingress_fqdn

  cloudflare_zone_id     = var.cloudflare_zone_id
  xo_sr_id               = var.xo_sr_id
  xo_network_id          = var.xo_network_id
  xo_template_id         = var.xo_template_id
  vault_url              = var.vault_url
  admin_pki_mount        = var.admin_pki_mount
  root_ca_pem            = var.root_ca_pem
  matchbox_http_endpoint = var.matchbox_http_endpoint
  services               = [var.service_fqdn]
  cnames                 = concat(local.cnames, local.internal_fqdns)
}

module "cname_records" {
  for_each = toset(local.cnames)

  source  = "git@github.com:nop-systems/tf-modules.git//base/dns-record?ref=dns-record/v0.2.0"
  name    = each.key
  type    = "CNAME"
  value   = var.fqdn
  zone_id = var.cloudflare_zone_id
}

module "internal_records" {
  for_each = toset(local.internal_fqdns)

  source  = "git@github.com:nop-systems/tf-modules.git//base/dns-record?ref=dns-record/v0.2.0"
  name    = each.key
  type    = "CNAME"
  value   = var.fqdn
  zone_id = var.cloudflare_zone_id
}

module "service_record" {
  source  = "git@github.com:nop-systems/tf-modules.git//base/dns-record?ref=dns-record/v0.2.0"
  name    = var.service_fqdn
  type    = "CNAME"
  value   = var.fqdn
  zone_id = var.cloudflare_zone_id
}
