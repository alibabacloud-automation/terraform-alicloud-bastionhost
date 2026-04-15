output "this_instance_id" {
  description = "The ID of the bastionhost instance."
  value       = module.bastionhost.this_instance_id
}

output "this_user_ids" {
  description = "Map of user IDs."
  value       = module.bastionhost.this_user_ids
}

output "this_user_group_name" {
  description = "The name of the bastionhost user group."
  value       = module.bastionhost.this_user_group_name
}

output "this_user_group_id" {
  description = "The ID of the bastionhost user group."
  value       = module.bastionhost.this_user_group_id
}

output "this_host_group_name" {
  description = "The name of the bastionhost host group."
  value       = module.bastionhost.this_host_group_name
}

output "this_host_group_id" {
  description = "The ID of the bastionhost host group."
  value       = module.bastionhost.this_host_group_id
}

output "this_host_ids" {
  description = "Map of host IDs."
  value       = module.bastionhost.this_host_ids
}

output "this_host_account_ids" {
  description = "Map of host account IDs."
  value       = module.bastionhost.this_host_account_ids
}
