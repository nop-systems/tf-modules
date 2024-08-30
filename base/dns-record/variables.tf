variable "zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
}

variable "name" {
  description = "DNS record name"
  type        = string
}

variable "type" {
  description = "record type (e.g. A, AAAA)"
  type        = string
}

variable "value" {
  description = "record value (e.g. IP address)"
  type        = string
  nullable    = false
}
