module "fcos" {
  source = "git@github.com:nop-systems/tf-modules.git//base/fcos/stack?ref=fcos/v0.7.0"
  # source = "../../base/fcos/stack"

  fqdn      = var.fqdn
  desc      = "Xen Orchestra (Community Edition)"
  xo_tags   = concat(var.xo_tags, ["service=xenorchestra"])
  memory    = 3072
  cpu_cores = 2
  disk_size = 30

  butane_snippets = [templatefile("${path.module}/xenorchestra.bu", {
    fqdn         = var.fqdn
    service_fqdn = var.service_fqdn
    # https://hub.docker.com/r/ezka77/xen-orchestra-ce
    xenorchestra_image = "docker.io/ezka77/xen-orchestra-ce:5.176"
    # https://hub.docker.com/r/valkey/valkey
    valkey_image = "docker.io/valkey/valkey:8.1"
    # https://github.com/goauthentik/authentik/pkgs/container/ldap
    authentik_ldap_image = "ghcr.io/goauthentik/ldap:${var.authentik_version}"
    authentik_host       = var.authentik_host
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
  name    = var.service_fqdn
  type    = "CNAME"
  value   = var.fqdn
  zone_id = var.cloudflare_zone_id
}
