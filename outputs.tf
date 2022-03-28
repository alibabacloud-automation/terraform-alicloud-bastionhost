output "instance_id" {
  description = "The Instance ID"
  value       = concat(alicloud_bastionhost_instance.instance.*.id, [""])[0]
}

output "user_name" {
  description = "Specify the New User Name. This Parameter Is Only by Letters, Lowercase Letters, Numbers, and Underscores (_), Supports up to 128 Characters."
  value       = concat(alicloud_bastionhost_user.user.*.user_name, [""])[0]
}

output "user_id" {
  description = "The Bastionhost User"
  value       = concat(alicloud_bastionhost_user.user.*.user_id, [""])[0]
}

output "user_group_name" {
  description = "Specify the New Group Name. Supports up to 128 Characters."
  value       = concat(alicloud_bastionhost_user_group.group.*.user_group_name, [""])[0]
}

