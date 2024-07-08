variable "vault_url" {
  type        = string
  description = "Main HA URL to vault cluster"
}

variable "issuer_ref" {
  type        = string
  description = "Issuer ref of current PKI servers Issuer"
}

variable "name" {
  description = "Name of the PKI, must be unique and URL-conform and should be lower-case. Will be used for mountpoint and policy name."
  type        = string
}

variable "organization" {
  type        = string
  description = "Organization to include in leaf certificates"
}

variable "ou" {
  type        = string
  description = "Organizational Unit to include in leaf certificates"
}

variable "allow_root_issuing_ttl" {
  type        = bool
  description = "temporarily increase max TTL of root issuer to 12 years to allow issuing of a new long term root CA"
}

variable "ttl" {
  type        = number
  description = "TTL for leaf certificates"
}

variable "root_ttl" {
  type        = number
  description = "TTL for root CA"
}

variable "domain_templates" {
  type        = list(string)
  description = "Domain templates for CN"
}
