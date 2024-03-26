
resource "vault_pki_secret_backend_intermediate_cert_request" "intermediate" {
  backend     = var.pki_mount
  type        = "internal"
  common_name = var.cn
  key_name    = var.slug
}

resource "vault_pki_secret_backend_root_sign_intermediate" "intermediate" {
  backend     = var.root_pki_mount
  common_name = var.cn
  csr         = vault_pki_secret_backend_intermediate_cert_request.intermediate.csr
  format      = "pem"
  ttl         = var.ttl
  issuer_ref  = var.root_issuer_ref

  organization = var.organization
  ou           = var.ou
  country      = var.country
  locality     = var.locality
  province     = var.province

  # do not allow intermediate to issue CAs
  max_path_length = 0
}

resource "vault_pki_secret_backend_intermediate_set_signed" "intermediate" {
  backend     = var.pki_mount
  certificate = vault_pki_secret_backend_root_sign_intermediate.intermediate.certificate
}


# broken: https://github.com/hashicorp/terraform-provider-vault/issues/1990 

# resource "vault_pki_secret_backend_issuer" "intermediate" {
#   backend     = var.pki_mount
#   issuer_ref  = vault_pki_secret_backend_intermediate_set_signed.intermediate.imported_issuers[0]
#   issuer_name = var.slug
#   usage       = var.issuing_active ? "crl-signing,issuing-certificates,ocsp-signing,read-only" : "crl-signing,ocsp-signing,read-only"
#   lifecycle {
#     replace_triggered_by = [null_resource.fix-issuer-cycle]
#   }
# }

resource "vault_generic_endpoint" "intermediate_issuer" {
  depends_on           = [vault_pki_secret_backend_intermediate_set_signed.intermediate]
  path                 = "${var.pki_mount}/issuer/${vault_pki_secret_backend_intermediate_set_signed.intermediate.imported_issuers[0]}"
  ignore_absent_fields = true
  write_fields         = ["issuer_id"]

  data_json = jsonencode({
    issuer_name = var.slug
    usage       = var.issuing_active ? "crl-signing,issuing-certificates,ocsp-signing,read-only" : "crl-signing,ocsp-signing,read-only"
  })
}
