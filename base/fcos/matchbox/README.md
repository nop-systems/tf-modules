# fcos-matchbox

This is an internal module for fcos and doesn’t get versioned independently.

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                     | Version  |
| ------------------------------------------------------------------------ | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.7.4 |
| <a name="requirement_http"></a> [http](#requirement_http)                | >= 3.4.1 |
| <a name="requirement_matchbox"></a> [matchbox](#requirement_matchbox)    | >= 0.5.2 |

## Providers

| Name                                                            | Version  |
| --------------------------------------------------------------- | -------- |
| <a name="provider_http"></a> [http](#provider_http)             | >= 3.4.1 |
| <a name="provider_matchbox"></a> [matchbox](#provider_matchbox) | >= 0.5.2 |

## Modules

No modules.

## Resources

| Name                                                                                                                              | Type        |
| --------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [matchbox_group.mapbymac](https://registry.terraform.io/providers/poseidon/matchbox/latest/docs/resources/group)                  | resource    |
| [matchbox_profile.fedora-coreos-install](https://registry.terraform.io/providers/poseidon/matchbox/latest/docs/resources/profile) | resource    |
| [http_http.fcos_releases](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http)                   | data source |

## Inputs

| Name                                                                                                | Description                                | Type     | Default    | Required |
| --------------------------------------------------------------------------------------------------- | ------------------------------------------ | -------- | ---------- | :------: |
| <a name="input_fcos_stream"></a> [fcos_stream](#input_fcos_stream)                                  | Fedora CoreOS stream                       | `string` | `"stable"` |    no    |
| <a name="input_fcos_version"></a> [fcos_version](#input_fcos_version)                               | Fedora CoreOS version (defaults to latest) | `string` | `null`     |    no    |
| <a name="input_fqdn"></a> [fqdn](#input_fqdn)                                                       | FQDN of the new Virtual Machine            | `string` | n/a        |   yes    |
| <a name="input_ignition"></a> [ignition](#input_ignition)                                           | compiled ignition config                   | `string` | n/a        |   yes    |
| <a name="input_mac_address"></a> [mac_address](#input_mac_address)                                  | MAC address of VM                          | `string` | n/a        |   yes    |
| <a name="input_matchbox_http_endpoint"></a> [matchbox_http_endpoint](#input_matchbox_http_endpoint) | matchbox http endpoint                     | `string` | n/a        |   yes    |

## Outputs

No outputs.

<!-- END_TF_DOCS -->
