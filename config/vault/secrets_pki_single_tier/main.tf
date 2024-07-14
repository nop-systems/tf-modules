module "pki_mount" {
  source = "git@github.com:nop-systems/tf-modules.git//config/vault/secrets_pki/mount?ref=vault_config/v1.1.2"

  vault_url = var.vault_url
  path      = "pki-${var.name}"
  ttl       = var.ttl
  max_ttl   = var.allow_root_issuing_ttl ? var.root_ttl : var.ttl
}

resource "vault_pki_secret_backend_config_issuers" "this" {
  backend = module.pki_mount.path
  default = var.issuer_ref
}

resource "vault_pki_secret_backend_role" "default" {
  backend    = module.pki_mount.path
  issuer_ref = var.issuer_ref
  name       = "default"

  key_type = "ec"
  key_bits = 256

  ttl     = var.ttl
  max_ttl = var.ttl

  organization = [var.organization]
  ou           = [var.ou]

  allowed_domains_template    = true
  allowed_domains             = var.domain_templates
  allow_bare_domains          = true
  allow_wildcard_certificates = false
  allow_localhost             = false
  enforce_hostnames           = false

  server_flag = false
  client_flag = true
}

data "vault_policy_document" "issuer" {
  rule {
    path         = "${module.pki_mount.path}/issue/${vault_pki_secret_backend_role.default.name}"
    capabilities = ["create", "update"]
  }
  rule {
    path         = "${module.pki_mount.path}/sign/${vault_pki_secret_backend_role.default.name}"
    capabilities = ["create", "update"]
  }
}

resource "vault_policy" "issuer" {
  name   = "pki-${var.name}-issuer"
  policy = data.vault_policy_document.issuer.hcl
}
