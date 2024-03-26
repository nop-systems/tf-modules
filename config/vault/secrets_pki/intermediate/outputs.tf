output "issuer_ref" {
  value = vault_pki_secret_backend_intermediate_set_signed.intermediate.imported_issuers[0]
}
