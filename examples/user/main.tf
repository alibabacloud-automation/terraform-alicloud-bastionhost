data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.vpcs[0].id
}

module "security_group" {
  source  = "alibaba/security-group/alicloud"
  version = "2.4.1"
  vpc_id  = data.alicloud_vpcs.default.vpcs[0].id
}

module "bastionhost_instance" {
  source = "../.."

  create_instance = true

  instance_config = {
    vswitch_id           = data.alicloud_vswitches.default.vswitches[0].id
    security_group_ids   = [module.security_group.this_security_group_id]
    description          = "tf-testacc-bastionhost"
    license_code         = "bhah_ent_50_asset"
    period               = 1
    enable_public_access = false
    bandwidth            = "5"
    storage              = "5"
    plan_code            = "cloudbastion"
  }
}

module "bastionhost_users" {
  source = "../.."

  create_instance      = false
  existing_instance_id = module.bastionhost_instance.this_instance_id

  users = {
    user1 = {
      user_name           = var.user_name
      display_name        = var.display_name
      comment             = var.user_comment
      email               = var.email
      mobile              = var.mobile
      mobile_country_code = var.mobile_country_code
      password            = var.password
      source              = "Local"
      status              = var.user_status
      create_attachment   = true
    }
  }

  create_user_group = true

  user_group_config = {
    user_group_name = var.user_group_name
    comment         = var.group_comment
  }
}
