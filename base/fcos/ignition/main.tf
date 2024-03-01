data "ct_config" "this" {
  content = sensitive(var.butane)
  strict  = true
  snippets = sensitive([
    templatefile("${path.module}/templates/base.bu.tftpl", {
      hostname = var.fqdn
    }),
    templatefile("${path.module}/templates/vault-agent.bu.tftpl", {
      vault_roleid           = var.approle_role_id
      vault_wrapped_secretid = var.approle_wrapped_secret_id
    }),
    templatefile("${path.module}/templates/ssh.bu.tftpl", {
      vault_url = var.vault_url
    }),
    templatefile("${path.module}/templates/pki.bu.tftpl", {
      fqdn        = var.fqdn
      vault_url   = var.vault_url
      root_ca_pem = var.root_ca_pem
    })
  ])
  # pretty_print = true
}
