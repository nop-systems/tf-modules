# vault

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
| <a name="module_cluster_AAAA_record"></a> [cluster\_AAAA\_record](#module\_cluster\_AAAA\_record) | git@github.com:nop-systems/tf-modules.git//base/dns-record | dns-record/v0.1.0 |
| <a name="module_cluster_A_record"></a> [cluster\_A\_record](#module\_cluster\_A\_record) | git@github.com:nop-systems/tf-modules.git//base/dns-record | dns-record/v0.1.0 |
| <a name="module_cluster_node_cname"></a> [cluster\_node\_cname](#module\_cluster\_node\_cname) | git@github.com:nop-systems/tf-modules.git//base/dns-record | dns-record/v0.1.0 |
| <a name="module_fcos"></a> [fcos](#module\_fcos) | git@github.com:nop-systems/tf-modules.git//base/fcos/stack | fcos/v0.2.5 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acme_email"></a> [acme\_email](#input\_acme\_email) | E-Mail address for ACME account | `string` | n/a | yes |
| <a name="input_cloudflare_zone_id"></a> [cloudflare\_zone\_id](#input\_cloudflare\_zone\_id) | Cloudflare Zone ID | `string` | n/a | yes |
| <a name="input_cluster_fqdn"></a> [cluster\_fqdn](#input\_cluster\_fqdn) | n/a | `string` | n/a | yes |
| <a name="input_cluster_members"></a> [cluster\_members](#input\_cluster\_members) | map of node name to FQDNs of all cluster members | `map(string)` | n/a | yes |
| <a name="input_fqdn"></a> [fqdn](#input\_fqdn) | Fully Qualified Domain Name of VM | `string` | n/a | yes |
| <a name="input_matchbox_http_endpoint"></a> [matchbox\_http\_endpoint](#input\_matchbox\_http\_endpoint) | matchbox http endpoint | `string` | n/a | yes |
| <a name="input_node"></a> [node](#input\_node) | Vault node name | `string` | n/a | yes |
| <a name="input_root_ca_pem"></a> [root\_ca\_pem](#input\_root\_ca\_pem) | Private Root Certificate (PEM) | `string` | n/a | yes |
| <a name="input_ssh_authorized_keys"></a> [ssh\_authorized\_keys](#input\_ssh\_authorized\_keys) | SSH authorized keys for VM | `list(string)` | n/a | yes |
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
  acme_email = ??? # E-Mail address for ACME account
  cloudflare_zone_id = ??? # Cloudflare Zone ID
  cluster_fqdn = ??? # 
  cluster_members = ??? # map of node name to FQDNs of all cluster members
  fqdn = ??? # Fully Qualified Domain Name of VM
  matchbox_http_endpoint = ??? # matchbox http endpoint
  node = ??? # Vault node name
  root_ca_pem = ??? # Private Root Certificate (PEM)
  ssh_authorized_keys = ??? # SSH authorized keys for VM
  vault_url = ??? # Vault URL
  xo_network_id = ??? # XenOrchestra Network UUID
  xo_sr_id = ??? # XenOrchestra Storage Repository UUID
  #xo_tags = [] # List of additional tags that should be attached to the VM
  xo_template_id = ??? # XenOrchestra Template UUID
  
}
```
<!-- END_TF_DOCS -->
