output "roleid" {
  value = vault_approle_auth_backend_role.role.role_id
}

output "secretid" {
  description = "secret-id, wrapped if TTL set"
  value       = vault_approle_auth_backend_role_secret_id.secret-id.wrapping_token
}

output "secretid_retriaval_path" {
  value = "auth/approle/role/${var.role_name}/secret-id"
}
