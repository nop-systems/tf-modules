terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "4.2.0"
    }
  }
  required_version = ">= 1.7.4"
}

provider "vault" {
}

module "auth_approle" {
  source = "../../config/vault/auth_approle"
}

# module "secrets_kv" {
#   source = "../../config/vault/secrets_kv"
# }

# module "secrets_pki" {
#   source = "../../config/vault/secrets_pki"

#   vault_url              = var.vault_url
#   servers_issuer_ref     = null
#   allow_root_issuing_ttl = true
#   organization           = "Studierendenschaft der Berliner Hochschule für Technik"
#   acme_allowed_domains   = "panke.studis-bht.de"
# }

# module "secrets_ssh" {
#   source = "../../config/vault/secrets_ssh"

#   default_user  = "core"
#   allowed_users = ["core"]
# }
