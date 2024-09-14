variable "vault_url" {
  type        = string
  description = "Main HA URL to vault cluster"
}

variable "servers_issuer_ref" {
  type        = string
  description = "Issuer ref of current PKI servers Issuer"
}

variable "allow_root_issuing_ttl" {
  type        = bool
  description = "temporarily increase max TTL of root issuer to 12 years to allow issuing of a new long term root CA"
}

variable "organization" {
  type        = string
  description = "Organization to include in leaf certificates"
}

variable "acme_allowed_domains" {
  type        = list(string)
  description = "Allowed domains for ACME role (only subdomains)"
}

variable "entity_metadata_ttl" {
  type        = number
  description = "Default TTL for certificates created with entity-metadata role"
  validation {
    condition     = var.entity_metadata_ttl <= var.entity_metadata_max_ttl
    error_message = "must not be greater than entity_metadata_max_ttl"
  }
}

variable "entity_metadata_max_ttl" {
  type        = number
  description = "Maximum TTL for certificates created with entity-metadata role"
}

variable "acme_noeab_ttl" {
  type        = number
  description = "Default TTL for certificates created with acme_noeab role"
  validation {
    condition     = var.acme_noeab_ttl <= var.acme_noeab_max_ttl
    error_message = "must not be greater than acme_noeab_max_ttl"
  }
}

variable "acme_noeab_max_ttl" {
  type        = number
  description = "Maximum TTL for certificates created with acme_noeab role"
}
