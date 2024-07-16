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
  type        = string
  description = "A FQDN defining the service, independent of the host"
}

variable "grafana_fqdn" {
  type        = string
  description = "Internal FQDN where Grafana will be reachable"
}

variable "loki_fqdn" {
  type        = string
  description = "Internal FQDN where Loki will be reachable"
}

variable "prometheus_fqdn" {
  type        = string
  description = "Internal FQDN where Prometheus will be reachable"
}

variable "alertmanager_fqdn" {
  type        = string
  description = "Internal FQDN where Altermanager will be reachable"
}

variable "ingress_fqdn" {
  type        = string
  description = "Internal FQDN where hosts can drop off their metrics and logs"
}

variable "trusted_proxies" {
  type        = list(string)
  description = "List of CIDRs that proxy headers should be accepted from"
}

variable "admin_pki_mount" {
  type        = string
  description = "vault mount whose default issuer should be used for validating admin client certificates"
}

variable "acme_ca" {
  type        = string
  description = "URL to ACME directory for internal CA"
}
