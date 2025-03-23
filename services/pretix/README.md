# hello-world

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
| <a name="module_pretix"></a> [pretix](#module\_pretix) | git@github.com:nop-systems/tf-modules.git//base/fcos/stack | fcos/v0.6.4 |
| <a name="module_service_cname_record"></a> [service\_cname\_record](#module\_service\_cname\_record) | git@github.com:nop-systems/tf-modules.git//base/dns-record | dns-record/v0.2.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acme_ca"></a> [acme\_ca](#input\_acme\_ca) | URL to ACME directory for internal CA | `string` | n/a | yes |
| <a name="input_admin_pki_mount"></a> [admin\_pki\_mount](#input\_admin\_pki\_mount) | vault mount whose default issuer should be used for validating admin client certificates | `string` | n/a | yes |
| <a name="input_cloudflare_zone_id"></a> [cloudflare\_zone\_id](#input\_cloudflare\_zone\_id) | Cloudflare Zone ID | `string` | n/a | yes |
| <a name="input_currency"></a> [currency](#input\_currency) | currency (eg. EUR, USD etc.) | `string` | n/a | yes |
| <a name="input_fqdn"></a> [fqdn](#input\_fqdn) | Fully Qualified Domain Name of VM | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name of the Pretix instance | `string` | n/a | yes |
| <a name="input_language"></a> [language](#input\_language) | language (eg. 'de' or 'en') | `string` | n/a | yes |
| <a name="input_mail_from"></a> [mail\_from](#input\_mail\_from) | Address to send mail from | `string` | n/a | yes |
| <a name="input_matchbox_http_endpoint"></a> [matchbox\_http\_endpoint](#input\_matchbox\_http\_endpoint) | matchbox http endpoint | `string` | n/a | yes |
| <a name="input_monitoring_ingress_url"></a> [monitoring\_ingress\_url](#input\_monitoring\_ingress\_url) | Base URL of Loki/Prometheus where logs and metrics will be pushed to (e.g. https://monitoring-ingress.example.com) | `string` | n/a | yes |
| <a name="input_oidc_authorization_endpoint"></a> [oidc\_authorization\_endpoint](#input\_oidc\_authorization\_endpoint) | OIDC Authorization Endpoint URL | `string` | n/a | yes |
| <a name="input_oidc_end_session_endpoint"></a> [oidc\_end\_session\_endpoint](#input\_oidc\_end\_session\_endpoint) | OIDC End Session Endpoint | `string` | n/a | yes |
| <a name="input_oidc_issuer"></a> [oidc\_issuer](#input\_oidc\_issuer) | OIDC Issuer URL | `string` | n/a | yes |
| <a name="input_oidc_jwks_uri"></a> [oidc\_jwks\_uri](#input\_oidc\_jwks\_uri) | OIDC JWKS URL | `string` | n/a | yes |
| <a name="input_oidc_scopes"></a> [oidc\_scopes](#input\_oidc\_scopes) | OIDC Scopes | `list(string)` | n/a | yes |
| <a name="input_oidc_title"></a> [oidc\_title](#input\_oidc\_title) | label on the login button | `string` | n/a | yes |
| <a name="input_oidc_token_endpoint"></a> [oidc\_token\_endpoint](#input\_oidc\_token\_endpoint) | OIDC Token Endpont URL | `string` | n/a | yes |
| <a name="input_oidc_userinfo_endpoint"></a> [oidc\_userinfo\_endpoint](#input\_oidc\_userinfo\_endpoint) | OIDC Userinfo Endpoint URL | `string` | n/a | yes |
| <a name="input_public_fqdn"></a> [public\_fqdn](#input\_public\_fqdn) | Public FQDN | `string` | n/a | yes |
| <a name="input_root_ca_pem"></a> [root\_ca\_pem](#input\_root\_ca\_pem) | Private Root Certificate (PEM) | `string` | n/a | yes |
| <a name="input_service_fqdn"></a> [service\_fqdn](#input\_service\_fqdn) | A FQDN defining the pretix service | `string` | n/a | yes |
| <a name="input_ssh_authorized_keys"></a> [ssh\_authorized\_keys](#input\_ssh\_authorized\_keys) | SSH authorized keys for VM | `list(string)` | n/a | yes |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | IANA timezone | `string` | n/a | yes |
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
  /* currency (eg. EUR, USD etc.) (required) */
  currency =
  /* Fully Qualified Domain Name of VM (required) */
  fqdn =
  /* Name of the Pretix instance (required) */
  instance_name =
  /* language (eg. 'de' or 'en') (required) */
  language =
  /* Address to send mail from (required) */
  mail_from =
  /* matchbox http endpoint (required) */
  matchbox_http_endpoint =
  /* Base URL of Loki/Prometheus where logs and metrics will be pushed to (e.g. https://monitoring-ingress.example.com) (required) */
  monitoring_ingress_url =
  /* OIDC Authorization Endpoint URL (required) */
  oidc_authorization_endpoint =
  /* OIDC End Session Endpoint (required) */
  oidc_end_session_endpoint =
  /* OIDC Issuer URL (required) */
  oidc_issuer =
  /* OIDC JWKS URL (required) */
  oidc_jwks_uri =
  /* OIDC Scopes (required) */
  oidc_scopes =
  /* label on the login button (required) */
  oidc_title =
  /* OIDC Token Endpont URL (required) */
  oidc_token_endpoint =
  /* OIDC Userinfo Endpoint URL (required) */
  oidc_userinfo_endpoint =
  /* Public FQDN (required) */
  public_fqdn =
  /* Private Root Certificate (PEM) (required) */
  root_ca_pem =
  /* A FQDN defining the pretix service (required) */
  service_fqdn =
  /* SSH authorized keys for VM (required) */
  ssh_authorized_keys =
  /* IANA timezone (required) */
  timezone =
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
  currency =
  fqdn =
  instance_name =
  language =
  mail_from =
  matchbox_http_endpoint =
  monitoring_ingress_url =
  oidc_authorization_endpoint =
  oidc_end_session_endpoint =
  oidc_issuer =
  oidc_jwks_uri =
  oidc_scopes =
  oidc_title =
  oidc_token_endpoint =
  oidc_userinfo_endpoint =
  public_fqdn =
  root_ca_pem =
  service_fqdn =
  ssh_authorized_keys =
  timezone =
  trusted_proxies =
  vault_url =
  xo_network_id =
  xo_sr_id =
  xo_template_id =
}
```
<!-- END_TF_DOCS -->
