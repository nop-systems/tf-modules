variable "role_name" {
  type        = string
  description = "The name of the application"
}

variable "wrapping_ttl" {
  type        = string
  description = "TTL for wrapped secret-id, unwrapped if set to null (duration string)"
}
