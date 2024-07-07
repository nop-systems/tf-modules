resource "vault_mount" "pki" {
  type                      = "pki"
  path                      = var.path
  default_lease_ttl_seconds = var.ttl
  max_lease_ttl_seconds     = var.max_ttl

  # https://developer.hashicorp.com/vault/api-docs/secret/pki#acme-required-headers
  # https://developer.hashicorp.com/vault/api-docs/secret/pki#read-issuer-certificate
  allowed_response_headers    = ["Last-Modified", "Location", "Replay-Nonce", "Link"]
  passthrough_request_headers = ["If-Modified-Since"]

  # https://developer.hashicorp.com/vault/docs/commands/pki/health-check#accessibility-of-audit-information
  audit_non_hmac_response_keys = [
    "certificate", "issuing_ca", "serial_number", "error", "ca_chain"
  ]
  audit_non_hmac_request_keys = ["certificate", "issuer_ref", "common_name", "alt_names", "other_sans", "ip_sans", "uri_sans", "ttl", "not_after", "serial_number", "key_type", "private_key_format", "managed_key_name", "managed_key_id", "ou", "organization", "country", "locality", "province", "street_address", "postal_code", "permitted_dns_domains", "policy_identifiers", "ext_key_usage_oids", "csr"]

  lifecycle {
    prevent_destroy = true
  }
}

# https://www.infralovers.com/blog/2023-10-16-hashicorp-vault-acme-terraform-configuration/
resource "vault_pki_secret_backend_config_cluster" "this" {
  backend = vault_mount.pki.path

  aia_path = "${var.vault_url}/v1/${vault_mount.pki.path}"
  path     = "${var.vault_url}/v1/${vault_mount.pki.path}"
}

resource "vault_pki_secret_backend_crl_config" "crl-config" {
  backend = vault_mount.pki.path

  expiry      = "10m"
  ocsp_expiry = "1m"
}

resource "vault_pki_secret_backend_config_urls" "this" {
  backend = vault_mount.pki.path

  enable_templating       = true
  issuing_certificates    = ["{{cluster_aia_path}}/issuer/{{issuer_id}}/der"]
  crl_distribution_points = ["{{cluster_aia_path}}/issuer/{{issuer_id}}/crl/der"]
  ocsp_servers            = ["{{cluster_path}}/ocsp"]
}

resource "vault_generic_endpoint" "config_auto-tidy" {
  depends_on           = [vault_mount.pki]
  path                 = "${vault_mount.pki.path}/config/auto-tidy"
  ignore_absent_fields = true
  disable_delete       = true

  data_json = jsonencode({
    enabled                                  = true
    tidy_cert_store                          = true
    tidy_revoked_certs                       = true
    tidy_revoked_cert_issuer_associations    = true
    tidy_acme                                = true
    maintain_stored_certificate_counts       = true
    publish_stored_certificate_count_metrics = true
  })
}
