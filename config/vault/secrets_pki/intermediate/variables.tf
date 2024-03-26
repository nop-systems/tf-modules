variable "cn" {
  type        = string
  description = "Certificate Name"
}

variable "slug" {
  type        = string
  description = "slug name used for ressource names"
}

variable "pki_mount" {
  type        = string
  description = "PKI secret engine mount point"
}

variable "root_pki_mount" {
  type        = string
  description = "PKI secret engine mount point containing root certificate"
}

variable "root_issuer_ref" {
  type        = string
  description = "Issuer to use for signing"
}

variable "ttl" {
  type        = number
  default     = 365 * 86400
  description = "TTL of intermediate in seconds"
}

variable "issuing_active" {
  type        = bool
  description = "Set to true allow issuing, else only crl-signing and ocsp-signing allowed"
}

variable "organization" {
  type    = string
  default = "nop.systems"
}

variable "ou" {
  type    = string
  default = "Trust Services"
}

variable "country" {
  type    = string
  default = "DE"
}

variable "locality" {
  type    = string
  default = "Berlin"
}

variable "province" {
  type    = string
  default = "Berlin"
}
