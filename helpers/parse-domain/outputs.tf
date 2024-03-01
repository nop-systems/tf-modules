output "tld" {
  description = "Top Level Domain"
  value       = local.components[length(local.components) - 1]
}

output "basezone" {
  description = "second-level-domain + tld"
  value       = "${local.components[length(local.components) - 2]}.${local.components[length(local.components) - 1]}"
}

output "subzone" {
  description = "the parts between second level domain and host"
  value       = join(".", slice(local.components, 1, length(local.components) - 2))
}

output "record_name" {
  description = "everything below the second-level-domain"
  value       = join(".", slice(local.components, 0, length(local.components) - 2))
}

output "host" {
  description = "Host Component"
  value       = length(local.components) > 2 ? local.components[0] : null
}


