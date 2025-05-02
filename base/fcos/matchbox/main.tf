data "http" "fcos_releases" {
  url = "https://builds.coreos.fedoraproject.org/streams/${var.fcos_stream}.json"
}

locals {
  fcos_release_json = jsondecode(data.http.fcos_releases.response_body)
  # fcos_latest       = local.fcos_release_json.architectures.x86_64.artifacts.metal.release
  fcos_kernel    = local.fcos_release_json.architectures.x86_64.artifacts.metal.formats.pxe.kernel.location
  fcos_initramfs = local.fcos_release_json.architectures.x86_64.artifacts.metal.formats.pxe.initramfs.location
  fcos_rootfs    = local.fcos_release_json.architectures.x86_64.artifacts.metal.formats.pxe.rootfs.location
}

// Fedora CoreOS profile
resource "matchbox_profile" "this" {
  name   = var.fqdn
  kernel = local.fcos_kernel

  initrd = [
    "--name main ${local.fcos_initramfs}"
  ]

  args = [
    "initrd=main",
    "coreos.live.rootfs_url=${local.fcos_rootfs}",
    "coreos.inst.install_dev=/dev/xvda",
    "coreos.inst.ignition_url=${var.matchbox_http_endpoint}/ignition?uuid=$${uuid}&mac=$${mac:hexhyp}"
  ]

  # mark as sensitive to reduce long plan output
  raw_ignition = sensitive(var.ignition)
}

resource "matchbox_group" "this" {
  name    = var.fqdn
  profile = matchbox_profile.this.name
  selector = {
    mac = var.mac_address
  }
}
