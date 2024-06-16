# secrets_ssh

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

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_generic_endpoint.ssh_client_ca](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_endpoint) | resource |
| [vault_generic_endpoint.ssh_host_ca](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_endpoint) | resource |
| [vault_mount.ssh_client_signer](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount) | resource |
| [vault_mount.ssh_host_signer](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount) | resource |
| [vault_policy.entity-metadata-ssh-host](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_ssh_secret_backend_role.client](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/ssh_secret_backend_role) | resource |
| [vault_ssh_secret_backend_role.host-entity-metadata](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/ssh_secret_backend_role) | resource |
| [vault_policy_document.entity-metadata-ssh-host](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_users"></a> [allowed\_users](#input\_allowed\_users) | Allowed usernames as SSH principal | `string` | n/a | yes |
| <a name="input_default_user"></a> [default\_user](#input\_default\_user) | Default username as SSH principal | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_signer_path"></a> [client\_signer\_path](#output\_client\_signer\_path) | ssh client signer mount path |
| <a name="output_client_signer_public_key"></a> [client\_signer\_public\_key](#output\_client\_signer\_public\_key) | public key used for signing client certificates |
| <a name="output_host_signer_path"></a> [host\_signer\_path](#output\_host\_signer\_path) | ssh host signer mount path |
| <a name="output_host_signer_public_key"></a> [host\_signer\_public\_key](#output\_host\_signer\_public\_key) | public key used for signing host certificates |

## Usage

```hcl
module "???" {
  source = "git@github.com:nop-systems/tf-modules.git//<module-path>?ref=<tag>"
  allowed_users = ??? # Allowed usernames as SSH principal
  default_user = ??? # Default username as SSH principal
  
}
```
<!-- END_TF_DOCS -->
