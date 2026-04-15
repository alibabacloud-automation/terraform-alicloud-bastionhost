output "this_instance_id" {
  description = "The ID of the bastionhost instance."
  value       = module.bastionhost_instance.this_instance_id
}

output "this_host_group_id" {
  description = "The ID of the bastionhost host group."
  value       = module.bastionhost_hosts.this_host_group_id
}

output "this_host_ids" {
  description = "Map of host IDs."
  value       = module.bastionhost_hosts.this_host_ids
}

output "this_host_account_ids" {
  description = "Map of host account IDs."
  value       = module.bastionhost_hosts.this_host_account_ids
}
