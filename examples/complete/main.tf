data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.vpcs.0.id
}

data "alicloud_resource_manager_resource_groups" "default" {
}

module "security_group" {
  source = "alibaba/security-group/alicloud"
  vpc_id = data.alicloud_vpcs.default.vpcs.0.id
}

module "bastionhost_instance" {
  source = "../.."

  #alicloud_bastionhost_instance
  create_instance = true

  vswitch_id           = data.alicloud_vswitches.default.vswitches.0.id
  security_group_ids   = [module.security_group.this_security_group_id]
  description          = var.description
  license_code         = var.license_code
  period               = var.period
  resource_group_id    = data.alicloud_resource_manager_resource_groups.default.ids.0
  enable_public_access = var.enable_public_access
  bandwidth            = var.bandwidth
  storage              = var.storage
  plan_code            = var.plan_code

  #alicloud_bastionhost_user
  create_user = false

  #alicloud_bastionhost_user_group
  create_user_group = false

  #alicloud_bastionhost_user_attachment
  create_user_attachment = false

}

module "bastionhost_user_and_user_group_attachment" {
  source = "../.."

  #alicloud_bastionhost_instance
  create_instance = false

  #alicloud_bastionhost_user
  create_user = true

  instance_id         = module.bastionhost_instance.instance_id
  display_name        = var.display_name
  user_comment        = var.user_comment
  email               = var.email
  mobile              = var.mobile
  mobile_country_code = "CN"
  user_name           = "tf-testacc-user"
  password            = var.password
  user_source         = "Local"
  user_status         = var.user_status

  #alicloud_bastionhost_user_group
  create_user_group = true

  user_group_name = var.user_group_name
  group_comment   = var.group_comment

  #alicloud_bastionhost_user_attachment
  create_user_attachment = true

}