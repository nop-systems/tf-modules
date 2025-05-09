# fcos-matchbox

This is an internal module for fcos and doesn’t get versioned independently.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.4 |
| <a name="requirement_http"></a> [http](#requirement\_http) | >= 3.4.1 |
| <a name="requirement_matchbox"></a> [matchbox](#requirement\_matchbox) | >= 0.5.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_http"></a> [http](#provider\_http) | >= 3.4.1 |
| <a name="provider_matchbox"></a> [matchbox](#provider\_matchbox) | >= 0.5.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [matchbox_group.this](https://registry.terraform.io/providers/poseidon/matchbox/latest/docs/resources/group) | resource |
| [matchbox_profile.this](https://registry.terraform.io/providers/poseidon/matchbox/latest/docs/resources/profile) | resource |
| [http_http.fcos_releases](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_fcos_stream"></a> [fcos\_stream](#input\_fcos\_stream) | Fedora CoreOS stream | `string` | `"stable"` | no |
| <a name="input_fqdn"></a> [fqdn](#input\_fqdn) | FQDN of the new Virtual Machine | `string` | n/a | yes |
| <a name="input_ignition"></a> [ignition](#input\_ignition) | compiled ignition config | `string` | n/a | yes |
| <a name="input_mac_address"></a> [mac\_address](#input\_mac\_address) | MAC address of VM | `string` | n/a | yes |
| <a name="input_matchbox_http_endpoint"></a> [matchbox\_http\_endpoint](#input\_matchbox\_http\_endpoint) | matchbox http endpoint | `string` | n/a | yes |

## Outputs

No outputs.

## Usage

```hcl
module "" {
  source = "git@github.com:nop-systems/tf-modules.git//<module-path>?ref=<tag>"
  
  /* FQDN of the new Virtual Machine (required) */
  fqdn =
  /* compiled ignition config (required) */
  ignition =
  /* MAC address of VM (required) */
  mac_address =
  /* matchbox http endpoint (required) */
  matchbox_http_endpoint =

  
  /* Fedora CoreOS stream (optional) */
  # fcos_stream = stable
}

module "" {
  source = "git@github.com:nop-systems/tf-modules.git//?ref="
  
  fqdn =
  ignition =
  mac_address =
  matchbox_http_endpoint =
}
```
<!-- END_TF_DOCS -->
