variable "zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
  default     = "96c197469cc8a73db1d9c6f1bba05574"
}

# variable "domain" {
#   description = "Domain to add the record to"
#   type        = string
#   default     = "studis-bht.de"
# }

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


