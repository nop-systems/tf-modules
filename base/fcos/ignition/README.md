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
| <a name="input_admin_pki_mount"></a> [admin\_pki\_mount](#input\_admin\_pki\_mount) | Vault PKI mount for admin client certificates | `string` | n/a | yes |
| <a name="input_approle_role_id"></a> [approle\_role\_id](#input\_approle\_role\_id) | Vault Approle role\_id | `string` | n/a | yes |
| <a name="input_approle_wrapped_secret_id"></a> [approle\_wrapped\_secret\_id](#input\_approle\_wrapped\_secret\_id) | Vault Approle secret\_id | `string` | n/a | yes |
| <a name="input_butane_snippets"></a> [butane\_snippets](#input\_butane\_snippets) | (application specific) butane configs | `list(string)` | n/a | yes |
| <a name="input_cnames"></a> [cnames](#input\_cnames) | List of CNAMEs as FQDNs | `list(string)` | `[]` | no |
| <a name="input_fqdn"></a> [fqdn](#input\_fqdn) | FQDN of the new Virtual Machine | `string` | n/a | yes |
| <a name="input_monitoring_ingress_url"></a> [monitoring\_ingress\_url](#input\_monitoring\_ingress\_url) | Base URL of Loki/Prometheus where logs and metrics will be pushed to (e.g. https://monitoring-ingress.example.com) | `string` | n/a | yes |
| <a name="input_root_ca_pem"></a> [root\_ca\_pem](#input\_root\_ca\_pem) | Private Root Certificate (PEM) | `string` | n/a | yes |
| <a name="input_services"></a> [services](#input\_services) | List of Services as shared FQDNs (possibly with shared secrets) | `list(string)` | `[]` | no |
| <a name="input_vault_url"></a> [vault\_url](#input\_vault\_url) | Vault URL | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ignition"></a> [ignition](#output\_ignition) | Ignition config |
| <a name="output_xo_tags"></a> [xo\_tags](#output\_xo\_tags) | XenOrchestra tags describing the base ignition |

## Usage

```hcl
module "" {
  source = "git@github.com:nop-systems/tf-modules.git//<module-path>?ref=<tag>"
  
  /* Vault PKI mount for admin client certificates (required) */
  admin_pki_mount =
  /* Vault Approle role_id (required) */
  approle_role_id =
  /* Vault Approle secret_id (required) */
  approle_wrapped_secret_id =
  /* (application specific) butane configs (required) */
  butane_snippets =
  /* FQDN of the new Virtual Machine (required) */
  fqdn =
  /* Base URL of Loki/Prometheus where logs and metrics will be pushed to (e.g. https://monitoring-ingress.example.com) (required) */
  monitoring_ingress_url =
  /* Private Root Certificate (PEM) (required) */
  root_ca_pem =
  /* Vault URL (required) */
  vault_url =

  
  /* List of CNAMEs as FQDNs (optional) */
  # cnames = []
  /* List of Services as shared FQDNs (possibly with shared secrets) (optional) */
  # services = []
}

module "" {
  source = "git@github.com:nop-systems/tf-modules.git//?ref="
  
  admin_pki_mount =
  approle_role_id =
  approle_wrapped_secret_id =
  butane_snippets =
  fqdn =
  monitoring_ingress_url =
  root_ca_pem =
  vault_url =
}
```
<!-- END_TF_DOCS -->
