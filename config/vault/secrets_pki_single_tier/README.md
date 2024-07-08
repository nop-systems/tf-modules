# secrets_pki_single_tier

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.4 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >=3.24.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | >=3.24.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_pki_mount"></a> [pki\_mount](#module\_pki\_mount) | git@github.com:nop-systems/tf-modules.git//config/vault/secrets_pki/mount | vault_config/v1.1.2 |

## Resources

| Name | Type |
|------|------|
| [vault_pki_secret_backend_config_issuers.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/pki_secret_backend_config_issuers) | resource |
| [vault_pki_secret_backend_role.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/pki_secret_backend_role) | resource |
| [vault_policy.issuer](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy_document.issuer](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_root_issuing_ttl"></a> [allow\_root\_issuing\_ttl](#input\_allow\_root\_issuing\_ttl) | temporarily increase max TTL of root issuer to 12 years to allow issuing of a new long term root CA | `bool` | n/a | yes |
| <a name="input_domain_templates"></a> [domain\_templates](#input\_domain\_templates) | Domain templates for CN | `list(string)` | n/a | yes |
| <a name="input_issuer_ref"></a> [issuer\_ref](#input\_issuer\_ref) | Issuer ref of current PKI servers Issuer | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the PKI, must be unique and URL-conform and should be lower-case. Will be used for mountpoint and policy name. | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | Organization to include in leaf certificates | `string` | n/a | yes |
| <a name="input_ou"></a> [ou](#input\_ou) | Organizational Unit to include in leaf certificates | `string` | n/a | yes |
| <a name="input_root_ttl"></a> [root\_ttl](#input\_root\_ttl) | TTL for root CA | `number` | n/a | yes |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | TTL for leaf certificates | `number` | n/a | yes |
| <a name="input_vault_url"></a> [vault\_url](#input\_vault\_url) | Main HA URL to vault cluster | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pki_path"></a> [pki\_path](#output\_pki\_path) | Path to PKI mount |
| <a name="output_policy_name"></a> [policy\_name](#output\_policy\_name) | Name of policy that allows issuing with default issuer |

## Usage

```hcl
module "" {
  source = "git@github.com:nop-systems/tf-modules.git//<module-path>?ref=<tag>"
  
  /* temporarily increase max TTL of root issuer to 12 years to allow issuing of a new long term root CA (required) */
  allow_root_issuing_ttl =
  /* Domain templates for CN (required) */
  domain_templates =
  /* Issuer ref of current PKI servers Issuer (required) */
  issuer_ref =
  /* Name of the PKI, must be unique and URL-conform and should be lower-case. Will be used for mountpoint and policy name. (required) */
  name =
  /* Organization to include in leaf certificates (required) */
  organization =
  /* Organizational Unit to include in leaf certificates (required) */
  ou =
  /* TTL for root CA (required) */
  root_ttl =
  /* TTL for leaf certificates (required) */
  ttl =
  /* Main HA URL to vault cluster (required) */
  vault_url =

  
}

module "" {
  source = "git@github.com:nop-systems/tf-modules.git//?ref="
  
  allow_root_issuing_ttl =
  domain_templates =
  issuer_ref =
  name =
  organization =
  ou =
  root_ttl =
  ttl =
  vault_url =
}
```
<!-- END_TF_DOCS -->
