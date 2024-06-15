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

variable "acme_email" {
  type        = string
  description = "E-Mail address for ACME account"
}

variable "matchbox_http_endpoint" {
  type        = string
  description = "matchbox http endpoint"
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
}

variable "ssh_authorized_keys" {
  description = "SSH authorized keys for VM"
  type        = list(string)
}

variable "cluster_members_fqdns" {
  description = "FQDNs of all cluster members"
  type        = list(string)
}

variable "cluster_fqdn" {
  description = "round-robin fqdn"
  type        = string
}

variable "acme_email" {
  description = "E-Mail-Address for ACME account"
  type        = string
}
