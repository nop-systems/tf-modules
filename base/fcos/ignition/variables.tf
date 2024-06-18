variable "fqdn" {
  type        = string
  description = "FQDN of the new Virtual Machine"
}

variable "cnames" {
  type        = list(string)
  description = "List of CNAMEs as FQDNs"
  default     = []
}

variable "services" {
  type        = list(string)
  description = "List of Services as shared FQDNs (possibly with shared secrets)"
  default     = []
}

variable "butane_snippets" {
  type        = list(string)
  description = "(application specific) butane configs"
  # reduce extensive printouts
  sensitive = true
}

variable "vault_url" {
  type        = string
  description = "Vault URL"
}

variable "approle_role_id" {
  type        = string
  description = "Vault Approle role_id"
}

variable "approle_wrapped_secret_id" {
  type        = string
  description = "Vault Approle secret_id"
  sensitive   = true
}

variable "root_ca_pem" {
  type        = string
  description = "Private Root Certificate (PEM)"
}

