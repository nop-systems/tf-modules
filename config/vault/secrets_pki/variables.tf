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
  description = "Organization to inlcude in leaf certificates"
}

variable "acme_allowed_domains" {
  type        = list(string)
  description = "Allowed domains for ACME role (only subdomains)"
}
