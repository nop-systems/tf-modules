output "path" {
  description = "approle auth mount path"
  value       = vault_auth_backend.approle.path
}
