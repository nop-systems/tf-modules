variable "zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
}

variable "record_name" {
  description = "DNS record name"
  type        = string
}

variable "records" {
  description = "DNS record type and value"
  type = map(object({
    type  = string
    value = string
  }))
}


