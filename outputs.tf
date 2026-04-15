output "this_instance_id" {
  description = "The ID of the bastionhost instance."
  value       = var.create_instance ? alicloud_bastionhost_instance.instance[0].id : ""
}

output "this_user_ids" {
  description = "Map of user IDs."
  value       = { for k, v in alicloud_bastionhost_user.this : k => v.user_id }
}

output "this_user_group_name" {
  description = "The name of the bastionhost user group."
  value       = var.create_user_group ? alicloud_bastionhost_user_group.group[0].user_group_name : ""
}

output "this_user_group_id" {
  description = "The ID of the bastionhost user group."
  value       = var.create_user_group ? alicloud_bastionhost_user_group.group[0].user_group_id : ""
}

output "this_host_group_name" {
  description = "The name of the bastionhost host group."
  value       = var.create_host_group ? alicloud_bastionhost_host_group.this[0].host_group_name : ""
}

output "this_host_group_id" {
  description = "The ID of the bastionhost host group."
  value       = var.create_host_group ? alicloud_bastionhost_host_group.this[0].host_group_id : ""
}

output "this_host_ids" {
  description = "Map of host IDs."
  value       = { for k, v in alicloud_bastionhost_host.this : k => v.host_id }
}

output "this_host_account_ids" {
  description = "Map of host account IDs."
  value       = { for k, v in alicloud_bastionhost_host_account.this : k => v.id }
}
