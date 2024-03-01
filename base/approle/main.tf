resource "vault_approle_auth_backend_role" "this" {
  backend        = "approle"
  role_name      = var.role_name
  token_policies = ["entity-hostname-kv-read", "entity-hostname-ssh-host", "entity-hostname-pki-servers"]
}

resource "vault_approle_auth_backend_role_secret_id" "this" {
  backend   = "approle"
  role_name = vault_approle_auth_backend_role.role.role_name

  wrapping_ttl = var.wrapping_ttl
}

#
# Create an entity using the role_name to avoid auto-created entities with random ids
# also add metadata
#

resource "vault_identity_entity" "this" {
  name = var.role_name
  metadata = {
    "managed-by" = "Terraform"
    "hostname"   = var.role_name
  }
}

data "vault_generic_secret" "approle_mount" {
  path = "/sys/auth/approle"
}

resource "vault_identity_entity_alias" "this" {
  canonical_id   = vault_identity_entity.identity.id
  mount_accessor = data.vault_generic_secret.approle_mount.data.accessor
  name           = vault_approle_auth_backend_role.role.role_id
}
