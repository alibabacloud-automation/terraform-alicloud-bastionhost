# terraform-alicloud-bastionhost

Terraform Module for creating Bastion Host resources on Alibaba Cloud.

These types of resources are supported:

* [alicloud_bastionhost_instance](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/bastionhost_instance)
* [alicloud_bastionhost_user](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/bastionhost_user)
* [alicloud_bastionhost_user_group](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/bastionhost_user_group)
* [alicloud_bastionhost_user_attachment](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/bastionhost_user_attachment)

## Usage

<div style="display: block;margin-bottom: 40px;"><div class="oics-button" style="float: right;position: absolute;margin-bottom: 10px;">
  <a href="https://api.aliyun.com/terraform?source=Module&activeTab=document&sourcePath=terraform-alicloud-modules%3A%3Abastionhost&spm=docs.m.terraform-alicloud-modules.bastionhost&intl_lang=EN_US" target="_blank">
    <img alt="Open in AliCloud" src="https://img.alicdn.com/imgextra/i1/O1CN01hjjqXv1uYUlY56FyX_!!6000000006049-55-tps-254-36.svg" style="max-height: 44px; max-width: 100%;">
  </a>
</div></div>

```hcl
module "example" {
  source             = "terraform-alicloud-modules/bastionhost/alicloud"
  create_instance    = true
  description        = "your_description"
  license_code       = "bhah_ent_50_asset"
  period             = 1
  vswitch_id         = "your_vswitch_id"
  security_group_ids = ["your_security_group_ids"]
  resource_group_id  = "your_resource_group_id"
  
  create_user         = true
  user_name           = "your_user_name"
  user_source         = "Local"
  password            = "your_password"
  user_comment        = "your_user_comment"
  email               = "your_email"
  display_name        = "your_display_name"
  mobile_country_code = "CN"

  create_user_group = true
  group_comment     = "your_group_comment"
  user_group_name   = "your_user_group_name"

  create_user_attachment = true

}
```

## Examples

* [complete example](https://github.com/terraform-alicloud-modules/terraform-alicloud-bastionhost/tree/main/examples/complete)

## Terraform versions

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.134.0 |

Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)