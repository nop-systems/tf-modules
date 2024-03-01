output "record_id" {
  value = {
    for k, v in cloudflare_record.record : k => v.id
  }
}

output "fqdn" {
  value = one(distinct(values(cloudflare_record.record)[*].hostname))
  # value = values{for type in keys(var.records) : type => cloudflare_record.record[type].hostname
}
