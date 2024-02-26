data "http" "fcos_releases" {
  url    = "https://builds.coreos.fedoraproject.org/streams/${var.fcos_stream}.json"
}

locals {
  fcos_latest = jsondecode(data.http.fcos_releases.response_body).architectures.x86_64.artifacts.metal.release
}