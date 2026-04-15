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

module "bastionhost_hosts" {
  source = "../.."

  create_instance      = false
  existing_instance_id = module.bastionhost_instance.this_instance_id

  create_host_group = true
  host_group_config = {
    host_group_name = "tf-testacc-host-group"
    comment         = "tf-testacc-host-group-comment"
  }

  hosts = {
    host1 = {
      host_name            = "tf-testacc-host-1"
      host_private_address = "172.16.0.10"
      create_attachment    = true
      accounts = {
        account1 = {
          host_account_name = "tf-testacc-account-1"
          password          = "YourPassword123!"
        }
      }
    }
    host2 = {
      host_name            = "tf-testacc-host-2"
      host_private_address = "172.16.0.11"
      os_type              = "Windows"
      create_attachment    = true
      accounts = {
        account1 = {
          host_account_name = "tf-testacc-account-2"
          protocol_name     = "RDP"
          password          = "YourPassword123!"
        }
      }
    }
  }
}
