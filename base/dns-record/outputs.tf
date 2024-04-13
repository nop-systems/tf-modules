output "record_id" {
  description = "ID of the cloudflare record resource"
  value       = cloudflare_record.this.id
}

output "fqdn" {
  value = cloudflare_record.this.hostname
}
