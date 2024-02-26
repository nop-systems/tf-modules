resource "vault_approle_auth_backend_role" "role" {
  backend        = "approle"
  role_name      = var.app_name
  token_policies = ["entity-hostname-kv-read", "entity-hostname-ssh-host", "entity-hostname-pki-servers"]
}

resource "vault_approle_auth_backend_role_secret_id" "secret-id" {
  backend   = "approle"
  role_name = vault_approle_auth_backend_role.role.role_name

  wrapping_ttl = "10m"
}

resource "vault_identity_entity" "identity" {
  name = var.app_name
  metadata = {
    "managed-by" = "terraform"
    "hostname"   = var.app_name
  }
}

data "vault_generic_secret" "approle_mount" {
  path = "/sys/auth/approle"
}

resource "vault_identity_entity_alias" "alias" {
  canonical_id   = vault_identity_entity.identity.id
  mount_accessor = data.vault_generic_secret.approle_mount.data.accessor
  name           = vault_approle_auth_backend_role.role.role_id
}

output "roleid" {
  value = vault_approle_auth_backend_role.role.role_id
}

output "secretid" {
  value = vault_approle_auth_backend_role_secret_id.secret-id.wrapping_token
}

output "secretid_retriaval_path" {
  value = "auth/approle/role/${var.app_name}/secret-id"
}
