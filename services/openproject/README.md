# OpenProject

## Secrets

- `kv/data/service/${ service_fqdn }/openproject`:
  ```json
  {
    "secret_key_base": "string"
  }
  ```
- `kv/data/service/${ service_fqdn }/postgres`:
  ```json
  {
    "password": "string"
  }
  ```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.4 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_fcos"></a> [fcos](#module\_fcos) | git@github.com:nop-systems/tf-modules.git//base/fcos/stack | fcos/v0.2.6 |
| <a name="module_service_cname_record"></a> [service\_cname\_record](#module\_service\_cname\_record) | git@github.com:nop-systems/tf-modules.git//base/dns-record | dns-record/v0.1.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acme_ca"></a> [acme\_ca](#input\_acme\_ca) | URL to ACME directory for internal CA | `string` | n/a | yes |
| <a name="input_cloudflare_zone_id"></a> [cloudflare\_zone\_id](#input\_cloudflare\_zone\_id) | Cloudflare Zone ID | `string` | n/a | yes |
| <a name="input_default_language"></a> [default\_language](#input\_default\_language) | Controls in which language basic data (such as types, status names, etc.) and demo data is being created in and sets the default fallback language for new users. | `string` | n/a | yes |
| <a name="input_fqdn"></a> [fqdn](#input\_fqdn) | Fully Qualified Domain Name of VM | `string` | n/a | yes |
| <a name="input_matchbox_http_endpoint"></a> [matchbox\_http\_endpoint](#input\_matchbox\_http\_endpoint) | matchbox http endpoint | `string` | n/a | yes |
| <a name="input_public_fqdn"></a> [public\_fqdn](#input\_public\_fqdn) | Public FQDN where OpenProject is reachable externally (used for links in emails) | `string` | n/a | yes |
| <a name="input_root_ca_pem"></a> [root\_ca\_pem](#input\_root\_ca\_pem) | Private Root Certificate (PEM) | `string` | n/a | yes |
| <a name="input_service_fqdn"></a> [service\_fqdn](#input\_service\_fqdn) | A FQDN defining the service, independent of the host | `string` | n/a | yes |
| <a name="input_trusted_proxies"></a> [trusted\_proxies](#input\_trusted\_proxies) | List of CIDRs that proxy headers should be accepted from | `list(string)` | n/a | yes |
| <a name="input_vault_url"></a> [vault\_url](#input\_vault\_url) | Vault URL | `string` | n/a | yes |
| <a name="input_xo_network_id"></a> [xo\_network\_id](#input\_xo\_network\_id) | XenOrchestra Network UUID | `string` | n/a | yes |
| <a name="input_xo_sr_id"></a> [xo\_sr\_id](#input\_xo\_sr\_id) | XenOrchestra Storage Repository UUID | `string` | n/a | yes |
| <a name="input_xo_tags"></a> [xo\_tags](#input\_xo\_tags) | List of additional tags that should be attached to the VM | `list(string)` | `[]` | no |
| <a name="input_xo_template_id"></a> [xo\_template\_id](#input\_xo\_template\_id) | XenOrchestra Template UUID | `string` | n/a | yes |

## Outputs

No outputs.

## Usage

```hcl
module "???" {
  source = "git@github.com:nop-systems/tf-modules.git//<module-path>?ref=<tag>"
  acme_ca = ??? # URL to ACME directory for internal CA
  cloudflare_zone_id = ??? # Cloudflare Zone ID
  default_language = ??? # Controls in which language basic data (such as types, status names, etc.) and demo data is being created in and sets the default fallback language for new users.
  fqdn = ??? # Fully Qualified Domain Name of VM
  matchbox_http_endpoint = ??? # matchbox http endpoint
  public_fqdn = ??? # Public FQDN where OpenProject is reachable externally (used for links in emails)
  root_ca_pem = ??? # Private Root Certificate (PEM)
  service_fqdn = ??? # A FQDN defining the service, independent of the host
  trusted_proxies = ??? # List of CIDRs that proxy headers should be accepted from
  vault_url = ??? # Vault URL
  xo_network_id = ??? # XenOrchestra Network UUID
  xo_sr_id = ??? # XenOrchestra Storage Repository UUID
  #xo_tags = [] # List of additional tags that should be attached to the VM
  xo_template_id = ??? # XenOrchestra Template UUID
  
}
```
<!-- END_TF_DOCS -->
