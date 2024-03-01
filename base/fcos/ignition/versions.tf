terraform {
  required_version = ">= 1.7.4"
  required_providers {
    ct = {
      source  = "poseidon/ct"
      version = ">= 0.13.0"
    }
  }
}
