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

variable "service_fqdn" {
  description = "A FQDN defining the service, independent of the host"
  type        = string
}

variable "authentik_host" {
  type        = string
  description = "(Internal) URL to authentik for Outposts"
}

variable "admin_pki_mount" {
  type        = string
  description = "vault mount whose default issuer should be used for validating admin client certificates"
}

variable "monitoring_ingress_url" {
  type        = string
  description = "Base URL of Loki/Prometheus where logs and metrics will be pushed to (e.g. https://monitoring-ingress.example.com)"
}

variable "authentik_version" {
  type        = string
  description = "Authentik version to use for LDAP outpost (image tag)"
}
