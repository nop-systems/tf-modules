resource "vault_approle_auth_backend_role" "this" {
  backend   = "approle"
  role_name = var.fqdn
  token_policies = concat([
    "entity-hostname-kv-read",
    "entity-hostname-ssh-host",
    "entity-hostname-pki-servers"
  ], var.additional_token_policies)
}

resource "vault_approle_auth_backend_role_secret_id" "this" {
  backend   = "approle"
  role_name = vault_approle_auth_backend_role.role.role_name

  wrapping_ttl          = var.wrapping_ttl
  with_wrapped_accessor = true
}

#
# Create an entity using the role_name to avoid auto-created entities with random ids
# also add metadata
#

resource "vault_identity_entity" "this" {
  name = var.fqdn
  metadata = {
    managed-by = "Terraform"
    fqdn       = var.fqdn
    cnames     = join(",", var.cnames)
    # Hacky solution: vault does not allow lists to be used in policy templates in most places
    cname00   = try(var.cnames[0], null)
    cname01   = try(var.cnames[1], null)
    cname02   = try(var.cnames[2], null)
    cname03   = try(var.cnames[3], null)
    cname04   = try(var.cnames[4], null)
    cname05   = try(var.cnames[5], null)
    cname06   = try(var.cnames[6], null)
    cname07   = try(var.cnames[7], null)
    cname08   = try(var.cnames[8], null)
    cname09   = try(var.cnames[9], null)
    services  = join(",", var.services)
    service00 = try(var.services[0], null)
    service01 = try(var.services[1], null)
    service02 = try(var.services[2], null)
    service03 = try(var.services[3], null)
    service04 = try(var.services[4], null)
  }
}

data "vault_generic_secret" "approle_mount" {
  path = "/sys/auth/approle"
}

resource "vault_identity_entity_alias" "this" {
  canonical_id   = vault_identity_entity.identity.id
  mount_accessor = data.vault_generic_secret.approle_mount.data.accessor
  name           = vault_approle_auth_backend_role.role.role_id
}
