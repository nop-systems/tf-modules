module "fcos" {
  source = "git@github.com:nop-systems/tf-modules.git//base/fcos/stack?ref=fcos/v0.6.5"

  fqdn      = var.fqdn
  desc      = "zammad"
  xo_tags   = concat(var.xo_tags, ["service=zammad"])
  memory    = 1024 * 12
  cpu_cores = 4
  disk_size = 200

  butane_snippets = [templatefile("${path.module}/zammad.bu", {
    acme_ca         = var.acme_ca
    fqdn            = var.fqdn
    service_fqdn    = var.service_fqdn
    trusted_proxies = join(" ", var.trusted_proxies)
    authentik_host  = var.authentik_host

    # https://github.com/zammad/zammad/pkgs/container/zammad
    zammad_image = "ghcr.io/zammad/zammad:6.4"
    # https://hub.docker.com/_/caddy
    caddy_image = "docker.io/library/caddy:2.9"
    # https://hub.docker.com/r/bitnami/elasticsearch
    elasticsearch_image = "docker.io/bitnami/elasticsearch:8"
    # https://hub.docker.com/_/postgres
    postgres_image = "docker.io/library/postgres:16-alpine"
    # https://hub.docker.com/_/memcached
    memcached_image = "docker.io/library/memcached:1.6-alpine"
    # https://hub.docker.com/r/valkey/valkey
    valkey_image = "docker.io/valkey/valkey:8.0"
    # https://ghcr.io/goauthentik/ldap
    authentik_ldap_image = "ghcr.io/goauthentik/ldap:2025.2"
  })]

  cloudflare_zone_id     = var.cloudflare_zone_id
  xo_sr_id               = var.xo_sr_id
  xo_network_id          = var.xo_network_id
  xo_template_id         = var.xo_template_id
  vault_url              = var.vault_url
  root_ca_pem            = var.root_ca_pem
  matchbox_http_endpoint = var.matchbox_http_endpoint
  services               = [var.service_fqdn]
  admin_pki_mount        = var.admin_pki_mount
  monitoring_ingress_url = var.monitoring_ingress_url
}

module "service_cname_record" {
  source  = "git@github.com:nop-systems/tf-modules.git//base/dns-record?ref=dns-record/v0.2.0"
  name    = var.service_fqdn       # DNS record name
  type    = "CNAME"                # record type (e.g. A, AAAA)
  value   = var.fqdn               # record value (e.g. IP address)
  zone_id = var.cloudflare_zone_id # Cloudflare Zone ID
}
