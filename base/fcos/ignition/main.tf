locals {
  xo_tags = [
    "os=Fedora Core OS",
    "prom:node=9999",
    "prom:podman=9999",
    "prom:vault-agent=9999",
    "prom:vault-ssh-signer=9999",
    "prom:zincati=9999"
  ]
}

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
      vault_version          = "latest"
    }),
    templatefile("${path.module}/templates/ssh.bu.tftpl", {
      vault_url             = var.vault_url
      vault_ssh_cli_version = "latest"
    }),
    templatefile("${path.module}/templates/pki.bu.tftpl", {
      fqdn        = var.fqdn
      alt_names   = join(",", concat(var.cnames, var.services))
      vault_url   = var.vault_url
      root_ca_pem = jsonencode(var.root_ca_pem)
    }),
    templatefile("${path.module}/templates/monitoring.bu.tftpl", {
      exporter_exporter_version = "latest"
    })
  ], var.butane_snippets)
  # pretty_print = true
}
