# pki-intermediate

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.4 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >=3.24.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | >=3.24.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_generic_endpoint.intermediate_issuer](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_endpoint) | resource |
| [vault_pki_secret_backend_intermediate_cert_request.intermediate](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/pki_secret_backend_intermediate_cert_request) | resource |
| [vault_pki_secret_backend_intermediate_set_signed.intermediate](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/pki_secret_backend_intermediate_set_signed) | resource |
| [vault_pki_secret_backend_root_sign_intermediate.intermediate](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/pki_secret_backend_root_sign_intermediate) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cn"></a> [cn](#input\_cn) | Certificate Name | `string` | n/a | yes |
| <a name="input_country"></a> [country](#input\_country) | n/a | `string` | `"DE"` | no |
| <a name="input_issuing_active"></a> [issuing\_active](#input\_issuing\_active) | Set to true allow issuing, else only crl-signing and ocsp-signing allowed | `bool` | n/a | yes |
| <a name="input_locality"></a> [locality](#input\_locality) | n/a | `string` | `"Berlin"` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | n/a | `string` | `"nop.systems"` | no |
| <a name="input_ou"></a> [ou](#input\_ou) | n/a | `string` | `"Trust Services"` | no |
| <a name="input_pki_mount"></a> [pki\_mount](#input\_pki\_mount) | PKI secret engine mount point | `string` | n/a | yes |
| <a name="input_province"></a> [province](#input\_province) | n/a | `string` | `"Berlin"` | no |
| <a name="input_root_issuer_ref"></a> [root\_issuer\_ref](#input\_root\_issuer\_ref) | Issuer to use for signing | `string` | n/a | yes |
| <a name="input_root_pki_mount"></a> [root\_pki\_mount](#input\_root\_pki\_mount) | PKI secret engine mount point containing root certificate | `string` | n/a | yes |
| <a name="input_slug"></a> [slug](#input\_slug) | slug name used for ressource names | `string` | n/a | yes |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | TTL of intermediate in seconds | `number` | `31536000` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_issuer_ref"></a> [issuer\_ref](#output\_issuer\_ref) | n/a |

## Usage

```hcl
module "???" {
  source = "git@github.com:nop-systems/tf-modules.git//<module-path>?ref=<tag>"
  cn = ??? # Certificate Name
  #country = DE # 
  issuing_active = ??? # Set to true allow issuing, else only crl-signing and ocsp-signing allowed
  #locality = Berlin # 
  #organization = nop.systems # 
  #ou = Trust Services # 
  pki_mount = ??? # PKI secret engine mount point
  #province = Berlin # 
  root_issuer_ref = ??? # Issuer to use for signing
  root_pki_mount = ??? # PKI secret engine mount point containing root certificate
  slug = ??? # slug name used for ressource names
  #ttl = 3.1536e+07 # TTL of intermediate in seconds
    
}
```
<!-- END_TF_DOCS -->
