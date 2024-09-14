#####
## PKI Mounts
#####

module "pki_root" {
  source    = "./mount"
  vault_url = var.vault_url
  path      = "pki-root"

  # ttl and max_ttl allow a maximum of 1 year for issued certificates
  # as the ttl also limits self-signed certificates, it must be increased temporarily (to 12 years) to issue a new root CA
  ttl     = 366 * 86400
  max_ttl = var.allow_root_issuing_ttl ? 12 * 365.25 * 86400 : 366 * 86400
}

module "pki_servers" {
  source    = "./mount"
  vault_url = var.vault_url
  path      = "pki-servers"
  ttl       = var.entity_metadata_ttl
  max_ttl   = max(var.entity_metadata_max_ttl, var.acme_noeab_max_ttl)
}

#####
## Intermediate Servers
#####


resource "vault_pki_secret_backend_config_issuers" "pki" {
  backend = module.pki_servers.path
  default = var.servers_issuer_ref
}

# Currently there is no use case for this role
#

# resource "vault_pki_secret_backend_role" "guests_any" {
#   backend    = module.pki_servers.path
#   issuer_ref = var.servers_issuer_ref
#   name       = "guests-any"

#   key_type = "ec"
#   key_bits = 256

#   ttl     = 86400
#   max_ttl = 86400

#   organization = [var.organization]
#   ou           = ["Servers"]

#   allowed_domains             = ["*.*.nop.systems"]
#   allow_bare_domains          = true
#   allow_glob_domains          = true
#   allow_wildcard_certificates = false
#   allow_subdomains            = true
#   allow_ip_sans               = false
#   allow_localhost             = false

#   client_flag = false
# }

resource "vault_pki_secret_backend_role" "entity_metadata" {
  backend    = module.pki_servers.path
  issuer_ref = var.servers_issuer_ref
  name       = "entity-metadata"

  key_type = "ec"
  key_bits = 256

  ttl     = var.entity_metadata_ttl
  max_ttl = var.entity_metadata_max_ttl

  organization = [var.organization]
  ou           = ["Servers (Approle)"]

  allowed_domains = [
    "{{identity.entity.metadata.fqdn}}",
    "{{identity.entity.metadata.cname00}}",
    "{{identity.entity.metadata.cname01}}",
    "{{identity.entity.metadata.cname02}}",
    "{{identity.entity.metadata.cname03}}",
    "{{identity.entity.metadata.cname04}}",
    "{{identity.entity.metadata.cname05}}",
    "{{identity.entity.metadata.cname06}}",
    "{{identity.entity.metadata.cname07}}",
    "{{identity.entity.metadata.cname08}}",
    "{{identity.entity.metadata.cname09}}",
    "{{identity.entity.metadata.service00}}",
    "{{identity.entity.metadata.service01}}",
    "{{identity.entity.metadata.service02}}",
    "{{identity.entity.metadata.service03}}",
    "{{identity.entity.metadata.service04}}",
  ]
  allowed_domains_template    = true
  allow_bare_domains          = true
  allow_glob_domains          = true
  allow_wildcard_certificates = false
  allow_subdomains            = true
  allow_ip_sans               = false
  allow_localhost             = false
}

#####
## Policies
#####

data "vault_policy_document" "entity-metadata-pki-servers" {
  rule {
    path         = "${module.pki_servers.path}/issue/${vault_pki_secret_backend_role.entity_metadata.name}"
    capabilities = ["create", "update"]
  }
  rule {
    path         = "${module.pki_servers.path}/sign/${vault_pki_secret_backend_role.entity_metadata.name}"
    capabilities = ["create", "update"]
  }
}

resource "vault_policy" "entity-metadata-pki-servers" {
  name   = "entity-metadata-pki-servers"
  policy = data.vault_policy_document.entity-metadata-pki-servers.hcl
}

#####
## ACME
#####

resource "vault_pki_secret_backend_role" "acme_noeab" {
  backend    = module.pki_servers.path
  issuer_ref = var.servers_issuer_ref
  name       = "acme-noeab"

  key_type = "ec"
  key_bits = 256

  ttl     = var.acme_noeab_ttl
  max_ttl = var.acme_noeab_max_ttl

  organization = [var.organization]
  ou           = ["Servers (ACME)"]

  allowed_domains             = var.acme_allowed_domains
  allow_bare_domains          = false
  allow_wildcard_certificates = false
  allow_subdomains            = true
  allow_ip_sans               = true
  allow_localhost             = false

  client_flag = false
}

resource "vault_generic_endpoint" "pki_acme" {
  depends_on           = [vault_pki_secret_backend_role.acme_noeab]
  path                 = "${module.pki_servers.path}/config/acme"
  ignore_absent_fields = true
  disable_delete       = true

  data_json = jsonencode({
    enabled                  = true,
    allowed_roles            = ["acme-noeab"]
    allowed_issuers          = [var.servers_issuer_ref]
    default_directory_policy = "role:acme-noeab"
  })
}
