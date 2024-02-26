resource "cloudflare_record" "record" {
  for_each = var.records

  zone_id = var.zone_id
  name    = var.record_name
  type    = each.value.type
  value   = each.value.value
  proxied = false
  comment = "managed by terraform"
}

output "record_id" {
  value = {
    for k, v in cloudflare_record.record : k => v.id
  }
}

output "fqdn" {
  value = one(distinct(values(cloudflare_record.record)[*].hostname))
  # value = values{for type in keys(var.records) : type => cloudflare_record.record[type].hostname
}


