terraform {
  required_version = ">= 1.7.4"
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = ">= 3.25.0"
    }
  }
}
