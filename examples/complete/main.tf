data "alicloud_zones" "default" {
}
data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}
resource "random_integer" "rand" {
  min = 1
  max = 1000
}

module "vpc" {
  source             = "alibaba/vpc/alicloud"
  create             = true
  vpc_cidr           = "172.16.0.0/16"
  vswitch_cidrs      = ["172.16.0.0/21"]
  availability_zones = [data.alicloud_zones.default.zones.0.id]
}

module "security_group" {
  source  = "alibaba/security-group/alicloud"
  create  = true
  version = "2.4.0"
  vpc_id  = module.vpc.this_vpc_id
}

module "bastionhost" {
  source = "../.."
  #  alicloud_bastionhost_instance
  create_instance    = true
  description        = "${var.description}-${random_integer.rand.result}"
  license_code       = var.license_code
  period             = 1
  vswitch_id         = module.vpc.this_vswitch_ids[0]
  security_group_ids = [module.security_group.this_security_group_id]
  resource_group_id  = data.alicloud_resource_manager_resource_groups.default.ids.0

  #  alicloud_bastionhost_user
  create_user         = true
  user_name           = "tf-testacc-${random_integer.rand.result}"
  user_source         = "Local"
  password            = var.password
  user_comment        = var.user_comment
  email               = var.email
  display_name        = var.display_name
  mobile_country_code = var.mobile_country_code

  #alicloud_bastionhost_user_group
  create_user_group = true
  group_comment     = var.group_comment
  user_group_name   = var.user_group_name

  #  alicloud_bastionhost_user_attachment
  create_user_attachment = true
}

