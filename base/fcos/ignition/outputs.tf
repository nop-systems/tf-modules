output "ignition" {
  description = "Ignition config"
  value       = data.ct_config.this.rendered
}
