output "host_signer_path" {
  description = "ssh host signer mount path"
  value       = vault_mount.ssh_host_signer.path
}

output "client_signer_path" {
  description = "ssh client signer mount path"
  value       = vault_mount.ssh_client_signer.path
}

output "host_signer_public_key" {
  description = "public key used for signing host certificates"
  value       = vault_generic_endpoint.ssh_host_ca.write_data["public_key"]
}

output "client_signer_public_key" {
  description = "public key used for signing client certificates"
  value       = vault_generic_endpoint.ssh_client_ca.write_data["public_key"]
}
