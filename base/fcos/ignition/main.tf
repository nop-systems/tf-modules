data "ct_config" "this" {
  content = templatefile("${path.module}/templates/base.bu.tftpl", {
    hostname = var.fqdn
  })
  strict = true
  snippets = concat([
    templatefile("${path.module}/templates/vault-agent.bu.tftpl", {
      vault_roleid           = var.approle_role_id
      vault_wrapped_secretid = var.approle_wrapped_secret_id
      vault_url              = var.vault_url
    }),
    templatefile("${path.module}/templates/ssh.bu.tftpl", {
      vault_url = var.vault_url
    }),
    templatefile("${path.module}/templates/pki.bu.tftpl", {
      fqdn        = var.fqdn
      vault_url   = var.vault_url
      root_ca_pem = jsonencode(var.root_ca_pem)
    })
  ], var.butane_snippets)
  # pretty_print = true
}
