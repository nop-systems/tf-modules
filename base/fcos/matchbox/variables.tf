variable "fqdn" {
  type        = string
  description = "FQDN of the new Virtual Machine"
}

variable "fcos_stream" {
  type        = string
  description = "Fedora CoreOS stream"
  default     = "stable"
}

variable "fcos_version" {
  type        = string
  description = "Fedora CoreOS version (defaults to latest)"
  default     = null
}

variable "mac_address" {
  type        = string
  description = "MAC address of VM"
}

variable "ignition" {
  type        = string
  description = "compiled ignition config"
  # reduce extensive printouts
  sensitive = true
}

variable "matchbox_http_endpoint" {
  type        = string
  description = "matchbox http endpoint"
}
