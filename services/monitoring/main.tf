module "fcos" {
  source = "git@github.com:nop-systems/tf-modules.git//base/fcos/stack?ref=fcos/v0.4.0"
  # source = "../../base/fcos/stack"

  fqdn      = var.fqdn
  desc      = "Monitoring Stack"
  xo_tags   = concat(var.xo_tags, ["service=monitoring"])
  memory    = 1024 * 4
  cpu_cores = 4
  disk_size = 50

  butane_snippets = [templatefile("${path.module}/monitoring.bu", {
    acme_ca                   = var.acme_ca
    fqdn                      = var.fqdn
    service_fqdn              = var.service_fqdn
    public_fqdn               = var.public_fqdn
    trusted_proxies           = join(" ", var.trusted_proxies)
    caddy_version             = "2.8"
    prometheus_version        = "v2.45.6"
    alertmanager_version      = "v0.27.0"
    blackbox_exporter_version = "v0.25.0"
    snmp_exporter_version     = "v0.26.0"
    loki_version              = "3.1.0"
    minio_version             = "RELEASE.2024-07-10T18-41-49Z"
    grafana_version           = "11.1.0"
    xo_sd_proxy_version       = "v0.1.0"
  })]

  cloudflare_zone_id          = var.cloudflare_zone_id
  xo_sr_id                    = var.xo_sr_id
  xo_network_id               = var.xo_network_id
  xo_template_id              = var.xo_template_id
  vault_url                   = var.vault_url
  additional_token_policies   = ["pki-monitoring-issuer"]
  monitoring_client_pki_mount = var.monitoring_client_pki_mount
  root_ca_pem                 = var.root_ca_pem
  matchbox_http_endpoint      = var.matchbox_http_endpoint
  services                    = [var.service_fqdn]
}

module "service_cname_record" {
  source  = "git@github.com:nop-systems/tf-modules.git//base/dns-record?ref=dns-record/v0.1.0"
  name    = var.service_fqdn       # DNS record name
  type    = "CNAME"                # record type (e.g. A, AAAA)
  value   = var.fqdn               # record value (e.g. IP address)
  zone_id = var.cloudflare_zone_id # Cloudflare Zone ID
}

