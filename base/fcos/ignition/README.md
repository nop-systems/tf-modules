# fcos-ignition

This is an internal module for fcos and doesn’t get versioned independently.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.4 |
| <a name="requirement_ct"></a> [ct](#requirement\_ct) | >= 0.13.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ct"></a> [ct](#provider\_ct) | >= 0.13.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ct_config.this](https://registry.terraform.io/providers/poseidon/ct/latest/docs/data-sources/config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_approle_role_id"></a> [approle\_role\_id](#input\_approle\_role\_id) | Vault Approle role\_id | `string` | n/a | yes |
| <a name="input_approle_wrapped_secret_id"></a> [approle\_wrapped\_secret\_id](#input\_approle\_wrapped\_secret\_id) | Vault Approle secret\_id | `string` | n/a | yes |
| <a name="input_butane_snippets"></a> [butane\_snippets](#input\_butane\_snippets) | (application specific) butane configs | `list(string)` | n/a | yes |
| <a name="input_fqdn"></a> [fqdn](#input\_fqdn) | FQDN of the new Virtual Machine | `string` | n/a | yes |
| <a name="input_root_ca_pem"></a> [root\_ca\_pem](#input\_root\_ca\_pem) | Private Root Certificate (PEM) | `string` | n/a | yes |
| <a name="input_vault_url"></a> [vault\_url](#input\_vault\_url) | Vault URL | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ignition"></a> [ignition](#output\_ignition) | Ignition config |

## Usage

```hcl
module "???" {
  source = "git@github.com:nop-systems/tf-modules.git//<module-path>?ref=<tag>"
  approle_role_id = ??? # Vault Approle role_id
  approle_wrapped_secret_id = ??? # Vault Approle secret_id
  butane_snippets = ??? # (application specific) butane configs
  fqdn = ??? # FQDN of the new Virtual Machine
  root_ca_pem = ??? # Private Root Certificate (PEM)
  vault_url = ??? # Vault URL
    
}
```
<!-- END_TF_DOCS -->
