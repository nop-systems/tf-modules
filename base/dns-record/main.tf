resource "cloudflare_record" "this" {
  zone_id = var.zone_id
  name    = var.name
  type    = var.type
  content = var.value
  proxied = false
  comment = "managed-by:Terraform;"
}
