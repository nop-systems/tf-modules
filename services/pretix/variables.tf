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
  description = "A FQDN defining the pretix service"
}

variable "public_fqdn" {
  type        = string
  description = "Public FQDN"
}

variable "admin_pki_mount" {
  type        = string
  description = "vault mount whose default issuer should be used for validating admin client certificates"
}

variable "trusted_proxies" {
  description = "List of CIDRs that proxy headers should be accepted from"
  type        = list(string)
}

variable "acme_ca" {
  type        = string
  description = "URL to ACME directory for internal CA"
}

variable "monitoring_ingress_url" {
  type        = string
  description = "Base URL of Loki/Prometheus where logs and metrics will be pushed to (e.g. https://monitoring-ingress.example.com)"
}

variable "ssh_authorized_keys" {
  type        = list(string)
  description = "SSH authorized keys for VM"
  default     = []
}

variable "mail_from" {
  type        = string
  description = "Address to send mail from"
}

variable "instance_name" {
  type        = string
  description = "Name of the Pretix instance"
}

variable "language" {
  type        = string
  description = "language (eg. 'de' or 'en')"
}

variable "timezone" {
  type        = string
  description = "IANA timezone"
}

variable "currency" {
  type        = string
  description = "currency (eg. EUR, USD etc.)"
}

variable "oidc_title" {
  type        = string
  description = "label on the login button"
}

variable "oidc_issuer" {
  type        = string
  description = "OIDC Issuer URL"
}

variable "oidc_authorization_endpoint" {
  type        = string
  description = "OIDC Authorization Endpoint URL"
}

variable "oidc_token_endpoint" {
  type        = string
  description = "OIDC Token Endpont URL"
}

variable "oidc_userinfo_endpoint" {
  type        = string
  description = "OIDC Userinfo Endpoint URL"
}

variable "oidc_end_session_endpoint" {
  type        = string
  description = "OIDC End Session Endpoint"
}

variable "oidc_jwks_uri" {
  type        = string
  description = "OIDC JWKS URL"
}

variable "oidc_scopes" {
  type        = list(string)
  description = "OIDC Scopes"
}
