# fcos-stack

Combined Ignition + Matchbox + VM modules for standard deployments

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.4 |
| <a name="requirement_macaddress"></a> [macaddress](#requirement\_macaddress) | >= 0.3.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_macaddress"></a> [macaddress](#provider\_macaddress) | >= 0.3.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_approle"></a> [approle](#module\_approle) | git@github.com:nop-systems/tf-modules.git//base/approle | approle/v0.1.2 |
| <a name="module_dns-record_A"></a> [dns-record\_A](#module\_dns-record\_A) | git@github.com:nop-systems/tf-modules.git//base/dns-record | dns-record/v0.1.0 |
| <a name="module_dns-record_AAAA"></a> [dns-record\_AAAA](#module\_dns-record\_AAAA) | git@github.com:nop-systems/tf-modules.git//base/dns-record | dns-record/v0.1.0 |
| <a name="module_domain"></a> [domain](#module\_domain) | git@github.com:nop-systems/tf-modules.git//helpers/parse-domain | parse-domain/v1.0.0 |
| <a name="module_ignition"></a> [ignition](#module\_ignition) | ../ignition | n/a |
| <a name="module_matchbox"></a> [matchbox](#module\_matchbox) | ../matchbox | n/a |
| <a name="module_vm"></a> [vm](#module\_vm) | ../vm | n/a |

## Resources

| Name | Type |
|------|------|
| [macaddress_macaddress.mac](https://registry.terraform.io/providers/ivoronin/macaddress/latest/docs/resources/macaddress) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_token_policies"></a> [additional\_token\_policies](#input\_additional\_token\_policies) | List of additional Policies assigned to the VM’s approle | `list(string)` | `[]` | no |
| <a name="input_admin_pki_mount"></a> [admin\_pki\_mount](#input\_admin\_pki\_mount) | PKI mount path for admin client certificates (e.g. pki-admin) | `string` | n/a | yes |
| <a name="input_butane_snippets"></a> [butane\_snippets](#input\_butane\_snippets) | (application specific) butane config | `list(string)` | n/a | yes |
| <a name="input_cloudflare_zone_id"></a> [cloudflare\_zone\_id](#input\_cloudflare\_zone\_id) | Cloudflare Zone ID | `string` | n/a | yes |
| <a name="input_cnames"></a> [cnames](#input\_cnames) | List of CNAMEs as FQDNs | `list(string)` | `[]` | no |
| <a name="input_cpu_cores"></a> [cpu\_cores](#input\_cpu\_cores) | Number of CPU cores | `number` | `1` | no |
| <a name="input_desc"></a> [desc](#input\_desc) | Description of the VM visible in XenOrchestra | `string` | `""` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Disk Size in GB for var partition disk (eg. 32) | `number` | `8` | no |
| <a name="input_fqdn"></a> [fqdn](#input\_fqdn) | Fully Qualified Domain Name of VM | `string` | n/a | yes |
| <a name="input_matchbox_http_endpoint"></a> [matchbox\_http\_endpoint](#input\_matchbox\_http\_endpoint) | matchbox http endpoint | `string` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | Memory in MB | `number` | `2048` | no |
| <a name="input_root_ca_pem"></a> [root\_ca\_pem](#input\_root\_ca\_pem) | Private Root Certificate (PEM) | `string` | n/a | yes |
| <a name="input_services"></a> [services](#input\_services) | List of Services as shared FQDNs (possibly with shared secrets) | `list(string)` | `[]` | no |
| <a name="input_vault_url"></a> [vault\_url](#input\_vault\_url) | Vault URL | `string` | n/a | yes |
| <a name="input_xo_network_id"></a> [xo\_network\_id](#input\_xo\_network\_id) | XenOrchestra Network UUID | `string` | n/a | yes |
| <a name="input_xo_sr_id"></a> [xo\_sr\_id](#input\_xo\_sr\_id) | XenOrchestra Storage Repository UUID | `string` | n/a | yes |
| <a name="input_xo_tags"></a> [xo\_tags](#input\_xo\_tags) | List of additional tags that should be attached to the VM | `list(string)` | `[]` | no |
| <a name="input_xo_template_id"></a> [xo\_template\_id](#input\_xo\_template\_id) | XenOrchestra Template UUID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ipv4_addresses"></a> [ipv4\_addresses](#output\_ipv4\_addresses) | List of IPv4 addresses reported by the guest agent |
| <a name="output_ipv6_addresses"></a> [ipv6\_addresses](#output\_ipv6\_addresses) | List of IPv6 addresses reported by the guest agent |
| <a name="output_vm_id"></a> [vm\_id](#output\_vm\_id) | UUID of created VM |

## Usage

```hcl
module "" {
  source = "git@github.com:nop-systems/tf-modules.git//<module-path>?ref=<tag>"
  
  /* PKI mount path for admin client certificates (e.g. pki-admin) (required) */
  admin_pki_mount =
  /* (application specific) butane config (required) */
  butane_snippets =
  /* Cloudflare Zone ID (required) */
  cloudflare_zone_id =
  /* Fully Qualified Domain Name of VM (required) */
  fqdn =
  /* matchbox http endpoint (required) */
  matchbox_http_endpoint =
  /* Private Root Certificate (PEM) (required) */
  root_ca_pem =
  /* Vault URL (required) */
  vault_url =
  /* XenOrchestra Network UUID (required) */
  xo_network_id =
  /* XenOrchestra Storage Repository UUID (required) */
  xo_sr_id =
  /* XenOrchestra Template UUID (required) */
  xo_template_id =

  
  /* List of additional Policies assigned to the VM’s approle (optional) */
  # additional_token_policies = []
  /* List of CNAMEs as FQDNs (optional) */
  # cnames = []
  /* Number of CPU cores (optional) */
  # cpu_cores = 1
  /* Description of the VM visible in XenOrchestra (optional) */
  # desc = 
  /* Disk Size in GB for var partition disk (eg. 32) (optional) */
  # disk_size = 8
  /* Memory in MB (optional) */
  # memory = 2048
  /* List of Services as shared FQDNs (possibly with shared secrets) (optional) */
  # services = []
  /* List of additional tags that should be attached to the VM (optional) */
  # xo_tags = []
}

module "" {
  source = "git@github.com:nop-systems/tf-modules.git//?ref="
  
  admin_pki_mount =
  butane_snippets =
  cloudflare_zone_id =
  fqdn =
  matchbox_http_endpoint =
  root_ca_pem =
  vault_url =
  xo_network_id =
  xo_sr_id =
  xo_template_id =
}
```
<!-- END_TF_DOCS -->
