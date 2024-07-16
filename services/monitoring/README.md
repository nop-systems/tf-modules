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
| <a name="module_cname_records"></a> [cname\_records](#module\_cname\_records) | git@github.com:nop-systems/tf-modules.git//base/dns-record | dns-record/v0.1.0 |
| <a name="module_fcos"></a> [fcos](#module\_fcos) | git@github.com:nop-systems/tf-modules.git//base/fcos/stack | fcos/v0.5.0 |
| <a name="module_internal_records"></a> [internal\_records](#module\_internal\_records) | git@github.com:nop-systems/tf-modules.git//base/dns-record | dns-record/v0.1.0 |
| <a name="module_service_record"></a> [service\_record](#module\_service\_record) | git@github.com:nop-systems/tf-modules.git//base/dns-record | dns-record/v0.1.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acme_ca"></a> [acme\_ca](#input\_acme\_ca) | URL to ACME directory for internal CA | `string` | n/a | yes |
| <a name="input_admin_pki_mount"></a> [admin\_pki\_mount](#input\_admin\_pki\_mount) | vault mount whose default issuer should be used for validating admin client certificates | `string` | n/a | yes |
| <a name="input_alertmanager_fqdn"></a> [alertmanager\_fqdn](#input\_alertmanager\_fqdn) | Internal FQDN where Altermanager will be reachable | `string` | n/a | yes |
| <a name="input_cloudflare_zone_id"></a> [cloudflare\_zone\_id](#input\_cloudflare\_zone\_id) | Cloudflare Zone ID | `string` | n/a | yes |
| <a name="input_fqdn"></a> [fqdn](#input\_fqdn) | Fully Qualified Domain Name of VM | `string` | n/a | yes |
| <a name="input_grafana_fqdn"></a> [grafana\_fqdn](#input\_grafana\_fqdn) | Internal FQDN where Grafana will be reachable | `string` | n/a | yes |
| <a name="input_ingress_fqdn"></a> [ingress\_fqdn](#input\_ingress\_fqdn) | Internal FQDN where hosts can drop off their metrics and logs | `string` | n/a | yes |
| <a name="input_loki_fqdn"></a> [loki\_fqdn](#input\_loki\_fqdn) | Internal FQDN where Loki will be reachable | `string` | n/a | yes |
| <a name="input_matchbox_http_endpoint"></a> [matchbox\_http\_endpoint](#input\_matchbox\_http\_endpoint) | matchbox http endpoint | `string` | n/a | yes |
| <a name="input_prometheus_fqdn"></a> [prometheus\_fqdn](#input\_prometheus\_fqdn) | Internal FQDN where Prometheus will be reachable | `string` | n/a | yes |
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
module "" {
  source = "git@github.com:nop-systems/tf-modules.git//<module-path>?ref=<tag>"
  
  /* URL to ACME directory for internal CA (required) */
  acme_ca =
  /* vault mount whose default issuer should be used for validating admin client certificates (required) */
  admin_pki_mount =
  /* Internal FQDN where Altermanager will be reachable (required) */
  alertmanager_fqdn =
  /* Cloudflare Zone ID (required) */
  cloudflare_zone_id =
  /* Fully Qualified Domain Name of VM (required) */
  fqdn =
  /* Internal FQDN where Grafana will be reachable (required) */
  grafana_fqdn =
  /* Internal FQDN where hosts can drop off their metrics and logs (required) */
  ingress_fqdn =
  /* Internal FQDN where Loki will be reachable (required) */
  loki_fqdn =
  /* matchbox http endpoint (required) */
  matchbox_http_endpoint =
  /* Internal FQDN where Prometheus will be reachable (required) */
  prometheus_fqdn =
  /* Private Root Certificate (PEM) (required) */
  root_ca_pem =
  /* A FQDN defining the service, independent of the host (required) */
  service_fqdn =
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
  alertmanager_fqdn =
  cloudflare_zone_id =
  fqdn =
  grafana_fqdn =
  ingress_fqdn =
  loki_fqdn =
  matchbox_http_endpoint =
  prometheus_fqdn =
  root_ca_pem =
  service_fqdn =
  trusted_proxies =
  vault_url =
  xo_network_id =
  xo_sr_id =
  xo_template_id =
}
```
<!-- END_TF_DOCS -->
