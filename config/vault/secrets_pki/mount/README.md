# pki-mount

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
| [vault_generic_endpoint.config_auto-tidy](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_endpoint) | resource |
| [vault_generic_endpoint.config_cluster](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_endpoint) | resource |
| [vault_generic_endpoint.config_urls](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_endpoint) | resource |
| [vault_generic_endpoint.tune](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_endpoint) | resource |
| [vault_mount.pki](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount) | resource |
| [vault_pki_secret_backend_crl_config.crl-config](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/pki_secret_backend_crl_config) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_max_ttl"></a> [max\_ttl](#input\_max\_ttl) | max TTL for issued certificates in seconds | `number` | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | Path of PKI mount | `string` | n/a | yes |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | default TTL for issued certificates in seconds | `number` | n/a | yes |
| <a name="input_vault_url"></a> [vault\_url](#input\_vault\_url) | Vault URI of Cluster | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_path"></a> [path](#output\_path) | n/a |

## Usage

```hcl
module "" {
  source = "git@github.com:nop-systems/tf-modules.git//<module-path>?ref=<tag>"
  
  /* max TTL for issued certificates in seconds (required) */
  max_ttl =
  /* Path of PKI mount (required) */
  path =
  /* default TTL for issued certificates in seconds (required) */
  ttl =
  /* Vault URI of Cluster (required) */
  vault_url =

  
}

module "" {
  source = "git@github.com:nop-systems/tf-modules.git//?ref="
  
  max_ttl =
  path =
  ttl =
  vault_url =
}
```
<!-- END_TF_DOCS -->
