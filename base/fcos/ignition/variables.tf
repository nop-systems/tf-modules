variable "fqdn" {
  type        = string
  description = "FQDN of the new Virtual Machine"
}

variable "butane" {
  type        = string
  description = "(application specific) butane config"
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
