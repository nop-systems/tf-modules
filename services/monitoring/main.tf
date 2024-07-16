locals {
  services = ["loki", "prometheus", "grafana", "alertmanager", "ingress"]
  cnames   = [for name in local.services : "${name}.${var.fqdn}"]
  internal_fqdns = [
    var.grafana_fqdn, var.loki_fqdn, var.prometheus_fqdn,
    var.alertmanager_fqdn, var.ingress_fqdn
  ]
}

module "fcos" {
  source = "git@github.com:nop-systems/tf-modules.git//base/fcos/stack?ref=fcos/v0.5.0"

  fqdn      = var.fqdn
  desc      = "Monitoring Stack"
  xo_tags   = concat(var.xo_tags, ["service=monitoring"])
  memory    = 1024 * 4
  cpu_cores = 4
  disk_size = 50

  butane_snippets = [
    templatefile("${path.module}/prometheus.bu", {
      alertmanager_version      = "v0.27.0"
      blackbox_exporter_version = "v0.25.0"
      prometheus_version        = "v2.45.6"
      service_fqdn              = var.service_fqdn
      snmp_exporter_version     = "v0.26.0"
      xo_sd_proxy_version       = "v0.1.0"
    }),
    templatefile("${path.module}/grafana.bu", {
      grafana_fqdn                   = var.grafana_fqdn
      grafana_image_renderer_version = "latest"
      grafana_version                = "11.1.0"
      service_fqdn                   = var.service_fqdn
    }),
    templatefile("${path.module}/loki.bu", {
      loki_version  = "3.1.0"
      minio_version = "RELEASE.2024-07-10T18-41-49Z"
      service_fqdn  = var.service_fqdn
    }),
    templatefile("${path.module}/caddy.bu", {
      acme_ca           = var.acme_ca
      admin_pki_mount   = var.admin_pki_mount
      alertmanager_fqdn = var.alertmanager_fqdn
      caddy_version     = "2.8"
      fqdn              = var.fqdn
      grafana_fqdn      = var.grafana_fqdn
      ingress_fqdn      = var.ingress_fqdn
      loki_fqdn         = var.loki_fqdn
      prometheus_fqdn   = var.prometheus_fqdn
      service_fqdn      = var.service_fqdn
      trusted_proxies   = join(" ", var.trusted_proxies)
    })
  ]

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

  source  = "git@github.com:nop-systems/tf-modules.git//base/dns-record?ref=dns-record/v0.1.0"
  name    = each.key
  type    = "CNAME"
  value   = var.fqdn
  zone_id = var.cloudflare_zone_id
}

module "internal_records" {
  for_each = toset(local.internal_fqdns)

  source  = "git@github.com:nop-systems/tf-modules.git//base/dns-record?ref=dns-record/v0.1.0"
  name    = each.key
  type    = "CNAME"
  value   = var.fqdn
  zone_id = var.cloudflare_zone_id
}

module "service_record" {
  source  = "git@github.com:nop-systems/tf-modules.git//base/dns-record?ref=dns-record/v0.1.0"
  name    = var.service_fqdn
  type    = "CNAME"
  value   = var.fqdn
  zone_id = var.cloudflare_zone_id
}
