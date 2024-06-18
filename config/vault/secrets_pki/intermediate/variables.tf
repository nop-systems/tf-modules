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
  description = "Value for Organization field"
  type        = string
}

variable "ou" {
  description = "Value for Organization field"
  type        = string
}

variable "country" {
  description = "Value for Organizational Unit field"
  type        = string
}

variable "locality" {
  description = "Value for Locality field"
  type        = string
}

variable "province" {
  description = "Value for province field"
  type        = string
}
