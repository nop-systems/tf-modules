variable "default_user" {
  type        = string
  description = "Default username as SSH principal"
}

variable "allowed_users" {
  type        = string
  description = "Allowed usernames as SSH principal"
}
