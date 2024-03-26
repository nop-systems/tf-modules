#####
## KV Mount
#####

resource "vault_mount" "kv" {
  path        = "kv"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

#####
## Policy: Allow approles to read own kv path
#####

resource "vault_policy" "approle-kv-read" {
  name   = "approle-kv-read"
  policy = data.vault_policy_document.approle-kv-read.hcl
}

data "vault_policy_document" "entity-metadata-kv-read" {
  rule {
    path         = "kv/data/{{identity.entity.metadata.fqdn}}/*"
    capabilities = ["read", "list"]
    description  = "Allow to read from kv path derived from entity metadata fqdn"
  }
}

resource "vault_policy" "entity-metadata-kv-read" {
  name   = "entity-metadata-kv-read"
  policy = data.vault_policy_document.entity-metadata-kv-read.hcl
}
