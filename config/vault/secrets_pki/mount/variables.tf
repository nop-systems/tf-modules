variable "vault_url" {
  type        = string
  description = "Vault URI of Cluster"
}

variable "path" {
  type        = string
  description = "Path of PKI mount"
}

variable "ttl" {
  type        = number
  description = "default TTL for issued certificates in seconds"
}

variable "max_ttl" {
  type        = number
  description = "max TTL for issued certificates in seconds"
}
