terraform {
  required_version = ">= 1.7.4"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4.40.0"
    }
  }
}
