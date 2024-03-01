resource "cloudflare_record" "this" {
  for_each = var.records

  zone_id = var.zone_id
  name    = var.record_name
  type    = each.value.type
  value   = each.value.value
  proxied = false
  comment = "managed-by:Terraform; "
}
