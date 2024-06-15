output "pki_root_path" {
  value       = module.pki_root.path
  description = "Path to PKI mount with root issuer"
}

output "pki_servers_path" {
  value       = module.pki_servers.path
  description = "Path to PKI mount with servers issuer"
}
