#####
## Transit Mount
#####

resource "vault_mount" "transit" {
  type = "transit"
  path = "transit"
}
