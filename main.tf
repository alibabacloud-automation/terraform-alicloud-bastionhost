locals {
  instance_id = var.instance_id != "" ? var.instance_id : concat(alicloud_bastionhost_instance.instance.*.id, [""])[0]
}

resource "alicloud_bastionhost_instance" "instance" {
  count                = var.create_instance ? 1 : 0
  vswitch_id           = var.vswitch_id
  security_group_ids   = var.security_group_ids
  description          = var.description
  license_code         = var.license_code
  period               = var.period
  resource_group_id    = var.resource_group_id
  enable_public_access = var.enable_public_access
  bandwidth            = var.bandwidth
  storage              = var.storage
  plan_code            = var.plan_code
}

resource "alicloud_bastionhost_user" "user" {
  count               = var.create_user ? 1 : 0
  instance_id         = local.instance_id
  display_name        = var.display_name
  comment             = var.user_comment
  email               = var.email
  mobile              = var.mobile
  mobile_country_code = var.mobile_country_code
  user_name           = var.user_name
  password            = var.password
  source              = var.user_source
  source_user_id      = var.source_user_id
  status              = var.user_status
}

resource "alicloud_bastionhost_user_group" "group" {
  count           = var.create_user_group ? 1 : 0
  instance_id     = local.instance_id
  user_group_name = var.user_group_name
  comment         = var.group_comment
}

resource "alicloud_bastionhost_user_attachment" "user_attachment" {
  count         = var.create_user_attachment ? 1 : 0
  instance_id   = local.instance_id
  user_group_id = concat(alicloud_bastionhost_user_group.group.*.user_group_id, [""])[0]
  user_id       = concat(alicloud_bastionhost_user.user.*.user_id, [""])[0]
}