output "ignition" {
  description = "Ignition config"
  value       = data.ct_config.this.rendered
}

output "xo_tags" {
  description = "XenOrchestra tags describing the base ignition"
  value       = local.xo_tags
}
