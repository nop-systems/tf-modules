output "ipv4_addresses" {
  description = "IPv4 addresses of VM"
  value       = xenorchestra_vm.this.ipv4_addresses
}

output "ipv6_addresses" {
  description = "IPv6 addresses of VM"
  value       = xenorchestra_vm.this.ipv6_addresses
}

output "id" {
  description = "UUID of created VM"
  value       = xenorchestra_vm.this.id
}
