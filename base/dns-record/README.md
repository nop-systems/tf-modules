# dns-record

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.4 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | >= 4.25.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | >= 4.25.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | DNS record name | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | record type (e.g. A, AAAA) | `string` | n/a | yes |
| <a name="input_value"></a> [value](#input\_value) | record value (e.g. IP address) | `string` | n/a | yes |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | Cloudflare Zone ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | n/a |
| <a name="output_record_id"></a> [record\_id](#output\_record\_id) | ID of the cloudflare record resource |

## Usage

```hcl
module "" {
  source = "git@github.com:nop-systems/tf-modules.git//<module-path>?ref=<tag>"
  
  /* DNS record name (required) */
  name =
  /* record type (e.g. A, AAAA) (required) */
  type =
  /* record value (e.g. IP address) (required) */
  value =
  /* Cloudflare Zone ID (required) */
  zone_id =

  
}

module "" {
  source = "git@github.com:nop-systems/tf-modules.git//?ref="
  
  name =
  type =
  value =
  zone_id =
}
```
<!-- END_TF_DOCS -->
