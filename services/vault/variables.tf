variable "fqdn" {
  type        = string
  description = "Fully Qualified Domain Name of VM"
}

variable "node" {
  type        = string
  description = "Vault node name"
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
  type        = string
  description = "Cloudflare Zone ID"
}

variable "ssh_authorized_keys" {
  type        = list(string)
  description = "SSH authorized keys for VM"
}

variable "cluster_members" {
  type        = map(string)
  description = "map of node name to FQDNs of all cluster members"
}

variable "cluster_fqdn" {
  type = string
}

variable "admin_pki_mount" {
  type        = string
  description = "vault mount whose default issuer should be used for validating admin client certificates"
}
