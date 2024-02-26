terraform {
  required_providers {
    xenorchestra = {
      source  = "terra-farm/xenorchestra"
      version = ">=0.26.1"
    }
    matchbox = {
      source  = "poseidon/matchbox"
      version = ">=0.5.2"
    }
    ct = {
      source  = "poseidon/ct"
      version = ">=0.13.0"
    }
    macaddress = {
      source  = "ivoronin/macaddress"
      version = ">=0.3.2"
    }
  }
}

