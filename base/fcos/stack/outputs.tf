output "vm_id" {
  description = "UUID of created VM"
  value       = module.vm.id
}

output "ipv4_addresses" {
  description = "List of IPv4 addresses reported by the guest agent"
  value       = module.vm.ipv4_addresses
}

output "ipv6_addresses" {
  description = "List of IPv6 addresses reported by the guest agent"
  value       = module.vm.ipv6_addresses
}
