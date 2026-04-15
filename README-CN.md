# terraform-alicloud-bastionhost

Terraform 模块用于在阿里云上创建堡垒机资源。

[English](https://github.com/alibabacloud-automation/terraform-alicloud-bastionhost/blob/main/README.md) | 简体中文

## 用法

<div style="display: block;margin-bottom: 40px;"><div class="oics-button" style="float: right;position: absolute;margin-bottom: 10px;">
  <a href="https://api.aliyun.com/terraform?source=Module&activeTab=document&sourcePath=terraform-alicloud-modules%3A%3Abastionhost&spm=docs.m.terraform-alicloud-modules.bastionhost&intl_lang=EN_US" target="_blank">
    <img alt="Open in AliCloud" src="https://img.alicdn.com/imgextra/i1/O1CN01hjjqXv1uYUlY56FyX_!!6000000006049-55-tps-254-36.svg" style="max-height: 44px; max-width: 100%;">
  </a>
</div></div>

```hcl
module "bastionhost" {
  source  = "terraform-alicloud-modules/bastionhost/alicloud"
  version = "x.x.x"

  create_instance = true

  instance_config = {
    vswitch_id         = "vsw-xxxxxxxxx"
    security_group_ids = ["sg-xxxxxxxxx"]
    description        = "tf-bastionhost"
    license_code       = "bhah_ent_50_asset"
    period             = 1
    plan_code          = "cloudbastion"
  }

  users = {
    user1 = {
      display_name = "tf-user"
      user_name    = "tf-testacc-user"
      password     = "YourPassword123!"
      source       = "Local"
      email        = "test@aliyun.com"
    }
  }

  create_user_group = true

  user_group_config = {
    user_group_name = "tf-user-group"
    comment         = "tf-testacc-group"
  }

  create_host_group = true

  host_group_config = {
    host_group_name = "tf-host-group"
    comment         = "tf-testacc-host-group"
  }

  hosts = {
    host1 = {
      host_name            = "tf-host"
      host_private_address = "172.16.0.10"
      os_type              = "Linux"
      source               = "Local"
      accounts = {
        account1 = {
          host_account_name = "tf-host-account"
          protocol_name     = "SSH"
          password          = "YourPassword123!"
        }
      }
    }
  }
}
```

## 示例

* [complete](https://github.com/terraform-alicloud-modules/terraform-alicloud-bastionhost/tree/main/examples/complete)
* [host](https://github.com/terraform-alicloud-modules/terraform-alicloud-bastionhost/tree/main/examples/host)
* [user](https://github.com/terraform-alicloud-modules/terraform-alicloud-bastionhost/tree/main/examples/user)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_bastionhost_host.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/bastionhost_host) | resource |
| [alicloud_bastionhost_host_account.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/bastionhost_host_account) | resource |
| [alicloud_bastionhost_host_attachment.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/bastionhost_host_attachment) | resource |
| [alicloud_bastionhost_host_group.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/bastionhost_host_group) | resource |
| [alicloud_bastionhost_instance.instance](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/bastionhost_instance) | resource |
| [alicloud_bastionhost_user.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/bastionhost_user) | resource |
| [alicloud_bastionhost_user_attachment.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/bastionhost_user_attachment) | resource |
| [alicloud_bastionhost_user_group.group](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/bastionhost_user_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_host_group"></a> [create\_host\_group](#input\_create\_host\_group) | Whether to create a bastionhost host group. | `bool` | `false` | no |
| <a name="input_create_instance"></a> [create\_instance](#input\_create\_instance) | Whether to create a bastionhost instance. | `bool` | `false` | no |
| <a name="input_create_user_group"></a> [create\_user\_group](#input\_create\_user\_group) | Whether to create a bastionhost user group. | `bool` | `false` | no |
| <a name="input_existing_host_group_id"></a> [existing\_host\_group\_id](#input\_existing\_host\_group\_id) | An existing bastionhost host group id. Used when create\_host\_group = false. | `string` | `null` | no |
| <a name="input_existing_instance_id"></a> [existing\_instance\_id](#input\_existing\_instance\_id) | An existing bastionhost instance id. Used when create\_instance = false. | `string` | `null` | no |
| <a name="input_existing_user_group_id"></a> [existing\_user\_group\_id](#input\_existing\_user\_group\_id) | An existing bastionhost user group id. Used when create\_user\_group = false. | `string` | `null` | no |
| <a name="input_host_group_config"></a> [host\_group\_config](#input\_host\_group\_config) | Configuration for the bastionhost host group. | <pre>object({<br/>    host_group_name = optional(string)<br/>    comment         = optional(string)<br/>  })</pre> | `{}` | no |
| <a name="input_hosts"></a> [hosts](#input\_hosts) | Map of hosts to create. Each host can have multiple accounts. | <pre>map(object({<br/>    host_name            = string<br/>    active_address_type  = optional(string, "Private")<br/>    host_private_address = string<br/>    os_type              = optional(string, "Linux")<br/>    source               = optional(string, "Local")<br/>    create_attachment    = optional(bool, false)<br/>    accounts = optional(map(object({<br/>      host_account_name = optional(string)<br/>      protocol_name     = optional(string, "SSH")<br/>      password          = optional(string)<br/>    })), {})<br/>  }))</pre> | `{}` | no |
| <a name="input_instance_config"></a> [instance\_config](#input\_instance\_config) | Configuration for the bastionhost instance. | <pre>object({<br/>    vswitch_id           = optional(string)<br/>    security_group_ids   = optional(list(string), [])<br/>    description          = optional(string)<br/>    license_code         = optional(string)<br/>    period               = optional(number, 1)<br/>    resource_group_id    = optional(string)<br/>    enable_public_access = optional(bool, false)<br/>    bandwidth            = optional(string)<br/>    storage              = optional(string)<br/>    plan_code            = optional(string)<br/>  })</pre> | `{}` | no |
| <a name="input_user_group_config"></a> [user\_group\_config](#input\_user\_group\_config) | Configuration for the bastionhost user group. | <pre>object({<br/>    user_group_name = optional(string)<br/>    comment         = optional(string)<br/>  })</pre> | `{}` | no |
| <a name="input_users"></a> [users](#input\_users) | Map of users to create. | <pre>map(object({<br/>    display_name        = optional(string)<br/>    comment             = optional(string)<br/>    email               = optional(string)<br/>    mobile              = optional(string)<br/>    mobile_country_code = optional(string, "CN")<br/>    user_name           = optional(string)<br/>    password            = optional(string)<br/>    source              = optional(string)<br/>    source_user_id      = optional(string)<br/>    status              = optional(string, "Normal")<br/>    create_attachment   = optional(bool, false)<br/>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this_host_account_ids"></a> [this\_host\_account\_ids](#output\_this\_host\_account\_ids) | Map of host account IDs. |
| <a name="output_this_host_group_id"></a> [this\_host\_group\_id](#output\_this\_host\_group\_id) | The ID of the bastionhost host group. |
| <a name="output_this_host_group_name"></a> [this\_host\_group\_name](#output\_this\_host\_group\_name) | The name of the bastionhost host group. |
| <a name="output_this_host_ids"></a> [this\_host\_ids](#output\_this\_host\_ids) | Map of host IDs. |
| <a name="output_this_instance_id"></a> [this\_instance\_id](#output\_this\_instance\_id) | The ID of the bastionhost instance. |
| <a name="output_this_user_group_id"></a> [this\_user\_group\_id](#output\_this\_user\_group\_id) | The ID of the bastionhost user group. |
| <a name="output_this_user_group_name"></a> [this\_user\_group\_name](#output\_this\_user\_group\_name) | The name of the bastionhost user group. |
| <a name="output_this_user_ids"></a> [this\_user\_ids](#output\_this\_user\_ids) | Map of user IDs. |
<!-- END_TF_DOCS -->

## 提交问题

如果您在使用此模块时遇到任何问题，请 [提交问题](https://github.com/alibabacloud-automation/terraform-alicloud-bastionhost/issues)。

## 作者

由阿里云 Terraform 团队创建和维护(terraform@alibabacloud.com)

## 许可证

Apache 2 许可证。有关完整详细信息，请参阅 [LICENSE](https://github.com/alibabacloud-automation/terraform-alicloud-bastionhost/blob/main/LICENSE)。

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/alibabacloud/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)

