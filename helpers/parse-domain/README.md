# parse-domain

Takes a domain and returns it split into parts. Only supports domains that allow second-level domain registration, so no ".co.uk" or similar.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.4 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | domain to parse | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_basezone"></a> [basezone](#output\_basezone) | second-level-domain + tld |
| <a name="output_host"></a> [host](#output\_host) | Host Component |
| <a name="output_record_name"></a> [record\_name](#output\_record\_name) | everything below the second-level-domain |
| <a name="output_subzone"></a> [subzone](#output\_subzone) | the parts between second level domain and host |
| <a name="output_tld"></a> [tld](#output\_tld) | Top Level Domain |
<!-- END_TF_DOCS -->
