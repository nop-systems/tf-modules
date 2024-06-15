#####
## Key for vault-unsealer
#####

resource "vault_transit_secret_backend_key" "seal_key" {
  backend = var.transit_mount_path
  name    = "seal"
  type    = "aes256-gcm96"
}


#####
## Policy: vault-unsealre
#####

data "vault_policy_document" "this" {
  rule {
    path         = "transit/encrypt/${vault_transit_secret_backend_key.seal_key.name}"
    capabilities = ["update"]
  }
  rule {
    path         = "transit/decrypt/${vault_transit_secret_backend_key.seal_key.name}"
    capabilities = ["update"]
  }
  rule {
    path         = "transit/rewrap/${vault_transit_secret_backend_key.seal_key.name}"
    capabilities = ["update"]
  }
}

resource "vault_policy" "this" {
  name   = "vault-unsealer"
  policy = data.vault_policy_document.this.hcl
}
