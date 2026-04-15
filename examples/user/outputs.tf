output "this_instance_id" {
  description = "The ID of the bastionhost instance."
  value       = module.bastionhost_instance.this_instance_id
}

output "this_user_ids" {
  description = "Map of user IDs."
  value       = module.bastionhost_users.this_user_ids
}

output "this_user_group_name" {
  description = "The name of the bastionhost user group."
  value       = module.bastionhost_users.this_user_group_name
}

output "this_user_group_id" {
  description = "The ID of the bastionhost user group."
  value       = module.bastionhost_users.this_user_group_id
}
