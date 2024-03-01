variable "name" {
  type        = string
  description = "Name of the new Virtual Machine"
}

variable "desc" {
  type        = string
  description = "Description of the VM visible in XenOrchestra"
  default     = ""
}

variable "network_id" {
  type        = string
  description = "XenOrchestra Network UUID"
}

variable "mac_address" {
  type        = string
  description = "MAC address to use for VM NIC"
}

variable "sr_id" {
  type        = string
  description = "XenOrchestra Storage Repository UUID"
}

variable "template_id" {
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

variable "affinity_host_id" {
  type        = string
  description = "The preferred host you would like the VM to run on. If changed on an existing VM it will require a reboot for the VM to be rescheduled."
  default     = null
}

variable "tags" {
  type        = list(string)
  description = "List of additional tags that should be attached to the VM"
  default     = []
}
