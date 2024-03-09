# vm

This is an internal module for fcos and doesn’t get versioned independently.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.4 |
| <a name="requirement_xenorchestra"></a> [xenorchestra](#requirement\_xenorchestra) | >= 0.28.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_xenorchestra"></a> [xenorchestra](#provider\_xenorchestra) | >= 0.28.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [xenorchestra_vm.this](https://registry.terraform.io/providers/vatesfr/xenorchestra/latest/docs/resources/vm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_affinity_host_id"></a> [affinity\_host\_id](#input\_affinity\_host\_id) | The preferred host you would like the VM to run on. If changed on an existing VM it will require a reboot for the VM to be rescheduled. | `string` | `null` | no |
| <a name="input_cpu_cores"></a> [cpu\_cores](#input\_cpu\_cores) | Number of CPU cores | `number` | `1` | no |
| <a name="input_desc"></a> [desc](#input\_desc) | Description of the VM visible in XenOrchestra | `string` | `""` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Disk Size in GB for var partition disk (eg. 32) | `number` | `8` | no |
| <a name="input_mac_address"></a> [mac\_address](#input\_mac\_address) | MAC address to use for VM NIC | `string` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | Memory in MB | `number` | `2048` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the new Virtual Machine | `string` | n/a | yes |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | XenOrchestra Network UUID | `string` | n/a | yes |
| <a name="input_sr_id"></a> [sr\_id](#input\_sr\_id) | XenOrchestra Storage Repository UUID | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | List of additional tags that should be attached to the VM | `list(string)` | `[]` | no |
| <a name="input_template_id"></a> [template\_id](#input\_template\_id) | XenOrchestra Template UUID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | UUID of created VM |
| <a name="output_ipv4_addresses"></a> [ipv4\_addresses](#output\_ipv4\_addresses) | IPv4 addresses of VM |
| <a name="output_ipv6_addresses"></a> [ipv6\_addresses](#output\_ipv6\_addresses) | IPv6 addresses of VM |
<!-- END_TF_DOCS -->
