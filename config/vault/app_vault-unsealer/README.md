# app_vault-unsealer

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
| [vault_policy.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_transit_secret_backend_key.seal_key](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/transit_secret_backend_key) | resource |
| [vault_policy_document.this](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |

## Inputs

No inputs.

## Outputs

No outputs.

## Usage

```hcl
module "???" {
  source = "git@github.com:nop-systems/tf-modules.git//<module-path>?ref=<tag>"
    
}
```
<!-- END_TF_DOCS -->
