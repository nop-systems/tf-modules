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

data "vault_policy_document" "entity-metadata-kv-read" {
  rule {
    path         = "kv/data/host/{{identity.entity.metadata.fqdn}}/*"
    capabilities = ["read", "list"]
    description  = "Allow to read from kv path derived from entity metadata fqdn"
  }
  rule {
    path         = "kv/data/service/{{identity.entity.metadata.service00}}/*"
    capabilities = ["read", "list"]
    description  = "Allow to read from kv path derived from entity metadata service00"
  }
  rule {
    path         = "kv/data/service/{{identity.entity.metadata.service01}}/*"
    capabilities = ["read", "list"]
    description  = "Allow to read from kv path derived from entity metadata service01"
  }
  rule {
    path         = "kv/data/service/{{identity.entity.metadata.service02}}/*"
    capabilities = ["read", "list"]
    description  = "Allow to read from kv path derived from entity metadata service02"
  }
  rule {
    path         = "kv/data/service/{{identity.entity.metadata.service03}}/*"
    capabilities = ["read", "list"]
    description  = "Allow to read from kv path derived from entity metadata service03"
  }
  rule {
    path         = "kv/data/service/{{identity.entity.metadata.service04}}/*"
    capabilities = ["read", "list"]
    description  = "Allow to read from kv path derived from entity metadata service04"
  }
}

resource "vault_policy" "entity-metadata-kv-read" {
  name   = "entity-metadata-kv-read"
  policy = data.vault_policy_document.entity-metadata-kv-read.hcl
}
