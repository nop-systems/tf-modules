variable "name" {
  type        = string
  description = "Name of the new Virtual Machine (should be a valid dns name)"
}

variable "domain" {
  type        = string
  description = "domain part of fqdn"
}

variable "desc" {
  type        = string
  description = "Description of the VM visible in XenOrchestra"
  default     = ""
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

variable "storage_repository" {
  type        = string
  description = "Storage Repository to use"
  default     = "Local storage"
}

variable "fcos_stream" {
  type        = string
  description = "Fedora CoreOS stream"
  default     = "stable"
}

variable "fcos_version" {
  type        = string
  description = "Fedora CoreOS version"
  default     = null
}

variable "butane" {
  type        = string
  description = "(application specific) butane config"
  # reduce extensive printouts
  sensitive = true
}

variable "ssh_authorized_keys" {
  type        = list(string)
  description = "List of SSH keys to inject into the VM"
  default     = []
}

variable "vault_version" {
  type        = string
  description = "Vault version to use"
  default     = "1.15"
}

variable "vault-ssh-cli_version" {
  type        = string
  description = "vault-ssh-cli Version to use"
  default     = "1.6.2"
}
