# Nextcloud

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
| <a name="module_collabora_service_cname_record"></a> [collabora\_service\_cname\_record](#module\_collabora\_service\_cname\_record) | git@github.com:nop-systems/tf-modules.git//base/dns-record | dns-record/v0.1.0 |
| <a name="module_fcos"></a> [fcos](#module\_fcos) | git@github.com:nop-systems/tf-modules.git//base/fcos/stack | fcos/v0.5.4 |
| <a name="module_nextcloud_service_cname_record"></a> [nextcloud\_service\_cname\_record](#module\_nextcloud\_service\_cname\_record) | git@github.com:nop-systems/tf-modules.git//base/dns-record | dns-record/v0.1.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acme_ca"></a> [acme\_ca](#input\_acme\_ca) | URL to ACME directory for internal CA | `string` | n/a | yes |
| <a name="input_admin_pki_mount"></a> [admin\_pki\_mount](#input\_admin\_pki\_mount) | vault mount whose default issuer should be used for validating admin client certificates | `string` | n/a | yes |
| <a name="input_cloudflare_zone_id"></a> [cloudflare\_zone\_id](#input\_cloudflare\_zone\_id) | Cloudflare Zone ID | `string` | n/a | yes |
| <a name="input_collabora_public_fqdn"></a> [collabora\_public\_fqdn](#input\_collabora\_public\_fqdn) | Public FQDN where Collabora CODE is reachable externally | `string` | n/a | yes |
| <a name="input_collabora_service_fqdn"></a> [collabora\_service\_fqdn](#input\_collabora\_service\_fqdn) | A FQDN defining the collabora service, independent of the host | `string` | n/a | yes |
| <a name="input_fqdn"></a> [fqdn](#input\_fqdn) | Fully Qualified Domain Name of VM | `string` | n/a | yes |
| <a name="input_matchbox_http_endpoint"></a> [matchbox\_http\_endpoint](#input\_matchbox\_http\_endpoint) | matchbox http endpoint | `string` | n/a | yes |
| <a name="input_nextcloud_public_fqdn"></a> [nextcloud\_public\_fqdn](#input\_nextcloud\_public\_fqdn) | Public FQDN where Nextcloud is reachable externally | `string` | n/a | yes |
| <a name="input_nextcloud_service_fqdn"></a> [nextcloud\_service\_fqdn](#input\_nextcloud\_service\_fqdn) | A FQDN defining the nextcloud service, independent of the host | `string` | n/a | yes |
| <a name="input_php_memory_limit"></a> [php\_memory\_limit](#input\_php\_memory\_limit) | PHP memory limit (1024M is a good default) | `string` | n/a | yes |
| <a name="input_php_upload_limit"></a> [php\_upload\_limit](#input\_php\_upload\_limit) | PHP (file) upload limit (20G is a good default) | `string` | n/a | yes |
| <a name="input_root_ca_pem"></a> [root\_ca\_pem](#input\_root\_ca\_pem) | Private Root Certificate (PEM) | `string` | n/a | yes |
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
module "" {
  source = "git@github.com:nop-systems/tf-modules.git//<module-path>?ref=<tag>"
  
  /* URL to ACME directory for internal CA (required) */
  acme_ca =
  /* vault mount whose default issuer should be used for validating admin client certificates (required) */
  admin_pki_mount =
  /* Cloudflare Zone ID (required) */
  cloudflare_zone_id =
  /* Public FQDN where Collabora CODE is reachable externally (required) */
  collabora_public_fqdn =
  /* A FQDN defining the collabora service, independent of the host (required) */
  collabora_service_fqdn =
  /* Fully Qualified Domain Name of VM (required) */
  fqdn =
  /* matchbox http endpoint (required) */
  matchbox_http_endpoint =
  /* Public FQDN where Nextcloud is reachable externally (required) */
  nextcloud_public_fqdn =
  /* A FQDN defining the nextcloud service, independent of the host (required) */
  nextcloud_service_fqdn =
  /* PHP memory limit (1024M is a good default) (required) */
  php_memory_limit =
  /* PHP (file) upload limit (20G is a good default) (required) */
  php_upload_limit =
  /* Private Root Certificate (PEM) (required) */
  root_ca_pem =
  /* List of CIDRs that proxy headers should be accepted from (required) */
  trusted_proxies =
  /* Vault URL (required) */
  vault_url =
  /* XenOrchestra Network UUID (required) */
  xo_network_id =
  /* XenOrchestra Storage Repository UUID (required) */
  xo_sr_id =
  /* XenOrchestra Template UUID (required) */
  xo_template_id =

  
  /* List of additional tags that should be attached to the VM (optional) */
  # xo_tags = []
}

module "" {
  source = "git@github.com:nop-systems/tf-modules.git//?ref="
  
  acme_ca =
  admin_pki_mount =
  cloudflare_zone_id =
  collabora_public_fqdn =
  collabora_service_fqdn =
  fqdn =
  matchbox_http_endpoint =
  nextcloud_public_fqdn =
  nextcloud_service_fqdn =
  php_memory_limit =
  php_upload_limit =
  root_ca_pem =
  trusted_proxies =
  vault_url =
  xo_network_id =
  xo_sr_id =
  xo_template_id =
}
```
<!-- END_TF_DOCS -->
