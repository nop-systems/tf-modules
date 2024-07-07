# secrets_pki

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.4 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >=4.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | >=4.3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_pki_root"></a> [pki\_root](#module\_pki\_root) | ./mount | n/a |
| <a name="module_pki_servers"></a> [pki\_servers](#module\_pki\_servers) | ./mount | n/a |

## Resources

| Name | Type |
|------|------|
| [vault_generic_endpoint.pki_acme](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_endpoint) | resource |
| [vault_pki_secret_backend_config_issuers.pki](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/pki_secret_backend_config_issuers) | resource |
| [vault_pki_secret_backend_role.acme_noeab](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/pki_secret_backend_role) | resource |
| [vault_pki_secret_backend_role.entity_metadata](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/pki_secret_backend_role) | resource |
| [vault_policy.entity-metadata-pki-servers](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy_document.entity-metadata-pki-servers](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acme_allowed_domains"></a> [acme\_allowed\_domains](#input\_acme\_allowed\_domains) | Allowed domains for ACME role (only subdomains) | `list(string)` | n/a | yes |
| <a name="input_allow_root_issuing_ttl"></a> [allow\_root\_issuing\_ttl](#input\_allow\_root\_issuing\_ttl) | temporarily increase max TTL of root issuer to 12 years to allow issuing of a new long term root CA | `bool` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | Organization to include in leaf certificates | `string` | n/a | yes |
| <a name="input_servers_issuer_ref"></a> [servers\_issuer\_ref](#input\_servers\_issuer\_ref) | Issuer ref of current PKI servers Issuer | `string` | n/a | yes |
| <a name="input_vault_url"></a> [vault\_url](#input\_vault\_url) | Main HA URL to vault cluster | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pki_root_path"></a> [pki\_root\_path](#output\_pki\_root\_path) | Path to PKI mount with root issuer |
| <a name="output_pki_servers_path"></a> [pki\_servers\_path](#output\_pki\_servers\_path) | Path to PKI mount with servers issuer |

## Usage

```hcl
module "" {
  source = "git@github.com:nop-systems/tf-modules.git//<module-path>?ref=<tag>"
  
  /* Allowed domains for ACME role (only subdomains) (required) */
  acme_allowed_domains =
  /* temporarily increase max TTL of root issuer to 12 years to allow issuing of a new long term root CA (required) */
  allow_root_issuing_ttl =
  /* Organization to include in leaf certificates (required) */
  organization =
  /* Issuer ref of current PKI servers Issuer (required) */
  servers_issuer_ref =
  /* Main HA URL to vault cluster (required) */
  vault_url =

  
}

module "" {
  source = "git@github.com:nop-systems/tf-modules.git//?ref="
  
  acme_allowed_domains =
  allow_root_issuing_ttl =
  organization =
  servers_issuer_ref =
  vault_url =
}
```
<!-- END_TF_DOCS -->
