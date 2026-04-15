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

module "bastionhost" {
  source = "../.."

  create_instance = true

  instance_config = {
    vswitch_id           = data.alicloud_vswitches.default.vswitches[0].id
    security_group_ids   = [module.security_group.this_security_group_id]
    description          = var.description
    license_code         = var.license_code
    period               = var.period
    enable_public_access = var.enable_public_access
    bandwidth            = var.bandwidth
    storage              = var.storage
    plan_code            = var.plan_code
  }

  users = {
    user1 = {
      display_name        = var.display_name
      comment             = var.user_comment
      email               = var.email
      mobile              = var.mobile
      mobile_country_code = "CN"
      user_name           = "tf-testacc-user"
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

  create_host_group = true

  host_group_config = {
    host_group_name = var.host_group_name
    comment         = var.host_group_comment
  }

  hosts = {
    host1 = {
      host_name            = var.host_name
      active_address_type  = var.host_active_address_type
      host_private_address = var.host_private_address
      os_type              = var.host_os_type
      source               = var.host_source
      create_attachment    = true
      accounts = {
        account1 = {
          host_account_name = var.host_account_name
          protocol_name     = var.host_protocol_name
          password          = var.host_account_password
        }
      }
    }
  }
}
