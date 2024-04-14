output "roleid" {
  value = vault_approle_auth_backend_role.this.role_id
}

output "secretid" {
  description = "secret-id, wrapped if TTL set"
  value       = vault_approle_auth_backend_role_secret_id.this.wrapping_token
}

output "secretid_retriaval_path" {
  value = "auth/approle/role/${var.fqdn}/secret-id"
}
