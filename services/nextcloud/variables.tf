variable "fqdn" {
  type        = string
  description = "Fully Qualified Domain Name of VM"
}

variable "xo_network_id" {
  type        = string
  description = "XenOrchestra Network UUID"
}

variable "xo_sr_id" {
  type        = string
  description = "XenOrchestra Storage Repository UUID"
}

variable "xo_template_id" {
  type        = string
  description = "XenOrchestra Template UUID"
}

variable "xo_tags" {
  type        = list(string)
  description = "List of additional tags that should be attached to the VM"
  default     = []
}

variable "vault_url" {
  type        = string
  description = "Vault URL"
}

variable "root_ca_pem" {
  type        = string
  description = "Private Root Certificate (PEM)"
}

variable "matchbox_http_endpoint" {
  type        = string
  description = "matchbox http endpoint"
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
}

variable "nextcloud_service_fqdn" {
  type        = string
  description = "A FQDN defining the nextcloud service, independent of the host"
}

variable "collabora_service_fqdn" {
  type        = string
  description = "A FQDN defining the collabora service, independent of the host"
}

variable "nextcloud_public_fqdn" {
  type        = string
  description = "Public FQDN where Nextcloud is reachable externally"
}

variable "collabora_public_fqdn" {
  type        = string
  description = "Public FQDN where Collabora CODE is reachable externally"
}


variable "trusted_proxies" {
  description = "List of CIDRs that proxy headers should be accepted from"
  type        = list(string)
}

variable "acme_ca" {
  type        = string
  description = "URL to ACME directory for internal CA"
}

variable "php_memory_limit" {
  type        = string
  description = "PHP memory limit (1024M is a good default)"
}

variable "php_upload_limit" {
  type        = string
  description = "PHP (file) upload limit (20G is a good default)"
}
