locals {
  xo_tags = [
    "os=Fedora Core OS",
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
      vault_ssh_cli_version = "1.8.1"
    }),
    templatefile("${path.module}/templates/pki.bu.tftpl", {
      fqdn            = var.fqdn
      alt_names       = join(",", concat(var.cnames, var.services))
      vault_url       = var.vault_url
      root_ca_pem     = jsonencode(var.root_ca_pem)
      admin_pki_mount = var.admin_pki_mount
    }),
    templatefile("${path.module}/templates/monitoring.bu.tftpl", {
      fqdn                   = var.fqdn
      monitoring_ingress_url = var.monitoring_ingress_url
      grafana_alloy_version  = "latest"
    })
  ], var.butane_snippets)
  # pretty_print = true
}
