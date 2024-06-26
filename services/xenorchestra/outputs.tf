output "ipv4_addresses" {
  description = "List of IPv4 addresses reported by the guest agent"
  value       = module.fcos.ipv4_addresses
}

output "ipv6_addresses" {
  description = "List of IPv6 addresses reported by the guest agent"
  value       = module.fcos.ipv6_addresses
}
