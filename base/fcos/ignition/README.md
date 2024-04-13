# fcos-ignition

This is an internal module for fcos and doesn’t get versioned independently.

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                     | Version   |
| ------------------------------------------------------------------------ | --------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.7.4  |
| <a name="requirement_ct"></a> [ct](#requirement_ct)                      | >= 0.13.0 |

## Providers

| Name                                          | Version   |
| --------------------------------------------- | --------- |
| <a name="provider_ct"></a> [ct](#provider_ct) | >= 0.13.0 |

## Modules

No modules.

## Resources

| Name                                                                                                  | Type        |
| ----------------------------------------------------------------------------------------------------- | ----------- |
| [ct_config.this](https://registry.terraform.io/providers/poseidon/ct/latest/docs/data-sources/config) | data source |

## Inputs

| Name                                                                                                         | Description                           | Type           | Default | Required |
| ------------------------------------------------------------------------------------------------------------ | ------------------------------------- | -------------- | ------- | :------: |
| <a name="input_approle_role_id"></a> [approle_role_id](#input_approle_role_id)                               | Vault Approle role_id                 | `string`       | n/a     |   yes    |
| <a name="input_approle_wrapped_secret_id"></a> [approle_wrapped_secret_id](#input_approle_wrapped_secret_id) | Vault Approle secret_id               | `string`       | n/a     |   yes    |
| <a name="input_butane_snippets"></a> [butane_snippets](#input_butane_snippets)                               | (application specific) butane configs | `list(string)` | n/a     |   yes    |
| <a name="input_fqdn"></a> [fqdn](#input_fqdn)                                                                | FQDN of the new Virtual Machine       | `string`       | n/a     |   yes    |
| <a name="input_root_ca_pem"></a> [root_ca_pem](#input_root_ca_pem)                                           | Private Root Certificate (PEM)        | `string`       | n/a     |   yes    |
| <a name="input_vault_url"></a> [vault_url](#input_vault_url)                                                 | Vault URL                             | `string`       | n/a     |   yes    |

## Outputs

| Name                                                        | Description     |
| ----------------------------------------------------------- | --------------- |
| <a name="output_ignition"></a> [ignition](#output_ignition) | Ignition config |

<!-- END_TF_DOCS -->
