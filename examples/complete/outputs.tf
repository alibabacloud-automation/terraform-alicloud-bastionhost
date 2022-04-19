output "instance_id" {
  description = "The Instance ID."
  value       = module.bastionhost_instance.instance_id
}

output "user_name" {
  description = "Specify the New User Name. This Parameter Is Only by Letters, Lowercase Letters, Numbers, and Underscores (_), Supports up to 128 Characters."
  value       = module.bastionhost_user_and_user_group_attachment.user_name
}

output "user_id" {
  description = "The Bastionhost User."
  value       = module.bastionhost_user_and_user_group_attachment.user_id
}

output "user_group_name" {
  description = "Specify the New Group Name. Supports up to 128 Characters."
  value       = module.bastionhost_user_and_user_group_attachment.user_group_name
}