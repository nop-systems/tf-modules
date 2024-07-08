output "pki_path" {
  value       = module.pki_mount.path
  description = "Path to PKI mount"
}

output "policy_name" {
  value       = vault_policy.issuer.name
  description = "Name of policy that allows issuing with default issuer"
}
