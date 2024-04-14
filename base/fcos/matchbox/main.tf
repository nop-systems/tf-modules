data "http" "fcos_releases" {
  url = "https://builds.coreos.fedoraproject.org/streams/${var.fcos_stream}.json"
}

locals {
  fcos_latest  = jsondecode(data.http.fcos_releases.response_body).architectures.x86_64.artifacts.metal.release
  fcos_version = var.fcos_version != null ? var.fcos_version : local.fcos_latest
}

// Fedora CoreOS profile
resource "matchbox_profile" "this" {
  name   = var.fqdn
  kernel = "https://builds.coreos.fedoraproject.org/prod/streams/${var.fcos_stream}/builds/${local.fcos_version}/x86_64/fedora-coreos-${local.fcos_version}-live-kernel-x86_64"

  initrd = [
    "--name main https://builds.coreos.fedoraproject.org/prod/streams/${var.fcos_stream}/builds/${local.fcos_version}/x86_64/fedora-coreos-${local.fcos_version}-live-initramfs.x86_64.img"
  ]

  args = [
    "initrd=main",
    "coreos.live.rootfs_url=https://builds.coreos.fedoraproject.org/prod/streams/${var.fcos_stream}/builds/${local.fcos_version}/x86_64/fedora-coreos-${local.fcos_version}-live-rootfs.x86_64.img",
    "coreos.inst.install_dev=/dev/xvda",
    "coreos.inst.ignition_url=${var.matchbox_http_endpoint}/ignition?uuid=$${uuid}&mac=$${mac:hexhyp}"
  ]

  # mark as sensitive to reduce long plan output
  raw_ignition = sensitive(var.ignition)
}

resource "matchbox_group" "this" {
  name    = var.fqdn
  profile = matchbox_profile.fedora-coreos-install.name
  selector = {
    mac = var.mac_address
  }
}
