# approle

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.4 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >= 3.25.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | >= 3.25.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_approle_auth_backend_role.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/approle_auth_backend_role) | resource |
| [vault_approle_auth_backend_role_secret_id.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/approle_auth_backend_role_secret_id) | resource |
| [vault_identity_entity.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_entity) | resource |
| [vault_identity_entity_alias.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_entity_alias) | resource |
| [vault_generic_secret.approle_mount](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | The name of the application | `string` | n/a | yes |
| <a name="input_wrapping_ttl"></a> [wrapping\_ttl](#input\_wrapping\_ttl) | TTL for wrapped secret-id, unwrapped if set to null (duration string) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_roleid"></a> [roleid](#output\_roleid) | n/a |
| <a name="output_secretid"></a> [secretid](#output\_secretid) | secret-id, wrapped if TTL set |
| <a name="output_secretid_retriaval_path"></a> [secretid\_retriaval\_path](#output\_secretid\_retriaval\_path) | n/a |
<!-- END_TF_DOCS -->
