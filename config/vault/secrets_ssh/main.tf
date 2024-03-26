#####
## CA Secret Mounts
#####

resource "vault_mount" "ssh_host_signer" {
  type        = "ssh"
  path        = "ssh-host"
  description = "SSH Certificate Authority for Host Certificates"
}

resource "vault_mount" "ssh_client_signer" {
  type        = "ssh"
  path        = "ssh"
  description = "SSH Certificate Authority for Client Certificates"
}

#####
## Configure CAs
#####

# key_type is not supported by vault_ssh_secret_backend_ca
# https://github.com/hashicorp/terraform-provider-vault/issues/1700
resource "vault_generic_endpoint" "ssh_client_ca" {
  path                 = "${vault_mount.ssh_client_signer.path}/config/ca"
  ignore_absent_fields = true
  data_json = jsonencode({
    "generate_signing_key" : true,
    "key_type" : "ed25519"
  })
  lifecycle {
    ignore_changes = [data_json]
  }
}

resource "vault_generic_endpoint" "ssh_host_ca" {
  path                 = "${vault_mount.ssh_host_signer.path}/config/ca"
  ignore_absent_fields = true
  data_json = jsonencode({
    "generate_signing_key" : true,
    "key_type" : "ed25519"
  })
  lifecycle {
    ignore_changes = [data_json]
  }
}

#####
## Create Roles
#####

resource "vault_ssh_secret_backend_role" "host-entity-metadata" {
  name                    = "entity-metadata"
  backend                 = vault_mount.ssh_host_signer.path
  key_type                = "ca"
  allow_host_certificates = true
  allowed_domains         = "{{identity.entity.metadata.fqdn}},{{identity.entity.metdata.cnames}}"
  allow_bare_domains      = true
  allow_subdomains        = true
  max_ttl                 = "21600" # 6h
  ttl                     = "21600" # 6h
}

resource "vault_ssh_secret_backend_role" "client" {
  name                    = "default"
  backend                 = vault_mount.ssh_client_signer.path
  key_type                = "ca"
  allow_user_certificates = true
  default_user            = var.default_user
  allowed_users           = var.allowed_users
  allowed_extensions      = "permit-pty,permit-port-forwarding"
  default_extensions = {
    "permit-pty" : ""
  }
  max_ttl = "3600" # 1h
}

#####
## Policies
#####

data "vault_policy_document" "entity-metadata-ssh-host" {
  rule {
    path         = "ssh-host/sign/entity-metadata"
    capabilities = ["update"]
    description  = "Allow to sign SSH certificate with approle role, allowing to use fqdn from entity fqdn or cname metadata field"
  }
  rule {
    path         = "ssh/config/ca"
    capabilities = ["read"]
    description  = "Read public_key from ca endpoint"
  }
}

resource "vault_policy" "entity-metadata-ssh-host" {
  name   = "entity-metadata-ssh-host"
  policy = data.vault_policy_document.entity-metadata-ssh-host.hcl
}
