terraform {
  required_version = ">= 1.7.4"
  required_providers {
    matchbox = {
      source  = "poseidon/matchbox"
      version = ">= 0.5.2"
    }
    http = {
      source  = "hashicorp/http"
      version = ">= 3.4.1"
    }
  }
}
