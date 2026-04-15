locals {
  instance_id   = var.create_instance ? alicloud_bastionhost_instance.instance[0].id : var.existing_instance_id
  user_group_id = var.create_user_group ? alicloud_bastionhost_user_group.group[0].user_group_id : var.existing_user_group_id
  host_group_id = var.create_host_group ? alicloud_bastionhost_host_group.this[0].host_group_id : var.existing_host_group_id

  host_accounts = merge([
    for host_key, host in var.hosts : {
      for account_key, account in host.accounts : "${host_key}-${account_key}" => {
        host_key          = host_key
        host_account_name = account.host_account_name
        protocol_name     = account.protocol_name
        password          = account.password
      }
    }
  ]...)
}

resource "alicloud_bastionhost_instance" "instance" {
  count                = var.create_instance ? 1 : 0
  vswitch_id           = var.instance_config.vswitch_id
  security_group_ids   = var.instance_config.security_group_ids
  description          = var.instance_config.description
  license_code         = var.instance_config.license_code
  period               = var.instance_config.period
  resource_group_id    = var.instance_config.resource_group_id
  enable_public_access = var.instance_config.enable_public_access
  bandwidth            = var.instance_config.bandwidth
  storage              = var.instance_config.storage
  plan_code            = var.instance_config.plan_code
}

resource "alicloud_bastionhost_user_group" "group" {
  count           = var.create_user_group ? 1 : 0
  instance_id     = local.instance_id
  user_group_name = var.user_group_config.user_group_name
  comment         = var.user_group_config.comment
}

resource "alicloud_bastionhost_user" "this" {
  for_each = var.users

  instance_id         = local.instance_id
  display_name        = each.value.display_name
  comment             = each.value.comment
  email               = each.value.email
  mobile              = each.value.mobile
  mobile_country_code = each.value.mobile_country_code
  user_name           = each.value.user_name
  password            = each.value.password
  source              = each.value.source
  source_user_id      = each.value.source_user_id
  status              = each.value.status
}

resource "alicloud_bastionhost_user_attachment" "this" {
  for_each = { for k, v in var.users : k => v if v.create_attachment }

  instance_id   = local.instance_id
  user_group_id = local.user_group_id
  user_id       = alicloud_bastionhost_user.this[each.key].user_id
}

resource "alicloud_bastionhost_host_group" "this" {
  count           = var.create_host_group ? 1 : 0
  instance_id     = local.instance_id
  host_group_name = var.host_group_config.host_group_name
  comment         = var.host_group_config.comment
}

resource "alicloud_bastionhost_host" "this" {
  for_each = var.hosts

  instance_id          = local.instance_id
  host_name            = each.value.host_name
  active_address_type  = each.value.active_address_type
  host_private_address = each.value.host_private_address
  os_type              = each.value.os_type
  source               = each.value.source
}

resource "alicloud_bastionhost_host_attachment" "this" {
  for_each = { for k, v in var.hosts : k => v if v.create_attachment }

  host_group_id = local.host_group_id
  host_id       = alicloud_bastionhost_host.this[each.key].host_id
  instance_id   = local.instance_id
}

resource "alicloud_bastionhost_host_account" "this" {
  for_each = local.host_accounts

  host_account_name = each.value.host_account_name
  host_id           = alicloud_bastionhost_host.this[each.value.host_key].host_id
  instance_id       = local.instance_id
  protocol_name     = each.value.protocol_name
  password          = each.value.password
}


