output "host_signer_path" {
  description = "ssh host signer mount path"
  value       = vault_mount.ssh_host_signer.path
}

output "client_signer_path" {
  description = "ssh client signer mount path"
  value       = vault_mount.ssh_client_signer.path
}
