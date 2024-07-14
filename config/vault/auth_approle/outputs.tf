output "path" {
  description = "approle auth mount path"
  value       = vault_auth_backend.approle.path
}

output "accessor" {
  description = "mount accessor"
  value       = vault_auth_backend.approle.accessor
}
