module "fcos" {
  source = "git@github.com:nop-systems/tf-modules.git//base/fcos/stack?ref=fcos/v0.7.0"
  # source = "../../base/fcos/stack"

  fqdn      = var.fqdn
  desc      = "OpenProject project managing software"
  xo_tags   = concat(var.xo_tags, ["service=openproject"])
  memory    = 1024 * 6
  cpu_cores = 4
  disk_size = 40

  butane_snippets = [templatefile("${path.module}/openproject.bu", {
    acme_ca          = var.acme_ca
    fqdn             = var.fqdn
    service_fqdn     = var.service_fqdn
    public_fqdn      = var.public_fqdn
    default_language = var.default_language
    trusted_proxies  = join(" ", var.trusted_proxies)
    authentik_host   = var.authentik_host
    # https://hub.docker.com/r/openproject/openproject
    openproject_image = "docker.io/openproject/openproject:15.4-slim"
    # https://hub.docker.com/_/caddy
    caddy_image = "docker.io/library/caddy:2.9"
    # https://hub.docker.com/_/postgres
    postgres_image = "docker.io/library/postgres:16-alpine"
    # https://hub.docker.com/_/memcached
    memcached_image = "docker.io/library/memcached:1.6-alpine"
    # https://github.com/goauthentik/authentik/pkgs/container/ldap
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
