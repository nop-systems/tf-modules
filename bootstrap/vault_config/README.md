# vault_config

Minimal vault config for the bootstrap vault. The bootstrap vault has no function, except for terraform to create an approle, which will later be replaced, when the real vault cluster is working.

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.7.4 |
| <a name="requirement_vault"></a> [vault](#requirement_vault)             | 4.2.0    |

## Providers

No providers.

## Modules

| Name                                                                    | Source                          | Version |
| ----------------------------------------------------------------------- | ------------------------------- | ------- |
| <a name="module_auth_approle"></a> [auth_approle](#module_auth_approle) | ../../config/vault/auth_approle | n/a     |

## Resources

No resources.

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
