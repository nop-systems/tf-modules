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

variable "upload_limit_GB" {
  type        = number
  description = "PHP (file) upload limit in GB (20GB is a good default)"
}

variable "php_apc_shm_size" {
  type        = string
  description = "PHP APCu shared memory size (128M is a good default)"
}

variable "php_opcache_memory_size" {
  type        = string
  description = "PHP OpCache Memory Size (128M is a good default)"
}

variable "php_memory_limit" {
  type        = string
  description = "PHP memory limit for occ commands (1024M is a good default)"
}

variable "default_language" {
  type        = string
  description = "default language (eg. 'de' or 'en')"
}

variable "default_locale" {
  type        = string
  description = "default locale (eg. 'de_DE' or 'en_GB')"
}

variable "default_phone_region" {
  type        = string
  description = "default region for phone numbers (ISO 3166-1 country codes)"
}

variable "default_timezone" {
  type        = string
  description = "default IANA timezone"
}

variable "apps" {
  type        = list(string)
  description = "List of additional App names to be installed"
}

variable "config" {
  type        = map(any)
  description = "A nextcloud config snippet (will be converted to json, format see \"occ config:list\"). Must not contain secrets."
}
