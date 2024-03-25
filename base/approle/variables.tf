variable "fqdn" {
  type        = string
  description = "The FQDN of the VM, will be used as role_name and for metadata"
}

variable "cnames" {
  type        = list(string)
  description = "List of altnatives Names as FQDN to include in metadata"
  default     = []
  validation {
    condition     = length(var.cnames) <= 10
    error_message = "Maximum of 10 CNAMEs supported for Approle metdata"
  }
}

variable "services" {
  type        = list(string)
  description = "List of services to include in metdata (to access common secrets)"
  validation {
    condition     = length(var.services) <= 5
    error_message = "Maximum of 5 Services supported for approle metadata"
  }
}

variable "additional_token_policies" {
  type        = list(string)
  description = "List of additional Policies assigned to tokens created with the Approle"
  default     = []
}

variable "wrapping_ttl" {
  type        = string
  description = "TTL for wrapped secret-id, unwrapped if set to null (duration string)"
}
