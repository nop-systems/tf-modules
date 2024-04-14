variable "fqdn" {
  type        = string
  description = "Fully Qualified Domain Name of VM"
}

variable "cnames" {
  type        = list(string)
  description = "List of CNAMEs as FQDNs"
  default     = []
}

variable "services" {
  type        = list(string)
  description = "List of Services as FQDNs (services are shared CNAMES, possibly with shared secrets)"
  default     = []
}

variable "desc" {
  type        = string
  description = "Description of the VM visible in XenOrchestra"
  default     = ""
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

variable "cpu_cores" {
  type        = number
  description = "Number of CPU cores"
  default     = 1
}

variable "memory" {
  type        = number
  description = "Memory in MB"
  default     = 2048
}

variable "disk_size" {
  type        = number
  description = "Disk Size in GB for var partition disk (eg. 32)"
  default     = 8
}

variable "xo_tags" {
  type        = list(string)
  description = "List of additional tags that should be attached to the VM"
  default     = []
}

variable "butane_snippets" {
  type        = list(string)
  description = "(application specific) butane config"
  # reduce extensive printouts
  sensitive = true
}

variable "vault_url" {
  type        = string
  description = "Vault URL"
}

variable "additional_token_policies" {
  type        = list(string)
  description = "List of additional Policies assigned to the VM’s approle"
  default     = []
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
