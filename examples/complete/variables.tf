#alicloud_bastionhost_instance
variable "description" {
  description = "Description of the instance. This name can have a string of 1 to 63 characters."
  type        = string
  default     = "tf-testacc-description"
}

variable "license_code" {
  description = "The package type of Cloud Bastionhost instance. You can query more supported types through the DescribePricingModule."
  type        = string
  default     = "bhah_ent_50_asset"
}

variable "period" {
  description = "Duration for initially producing the instance. Valid values: [1~9], 12, 24, 36."
  type        = number
  default     = 1
}

variable "enable_public_access" {
  description = "Whether to Enable the public internet access to a specified Bastionhost instance. The valid values: true, false."
  type        = bool
  default     = false
}

variable "bandwidth" {
  description = "The bandwidth of Cloud Bastionhost instance. If China-Site Account, its valid values: 0 to 150. Unit: Mbit/s. The value must be a multiple of 5. If International-Site Account, its valid values: 0 to 200. Unit: Mbit/s. The value must be a multiple of 10."
  type        = string
  default     = "5"
}

variable "storage" {
  description = "The storage of Cloud Bastionhost instance. Valid values: 0 to 500. Unit: TB."
  type        = string
  default     = "5"
}

variable "plan_code" {
  description = "The plan code of Cloud Bastionhost instance. Valid values: cloudbastion: Basic Edition; cloudbastion_ha: HA Edition."
  type        = string
  default     = "cloudbastion"
}

#alicloud_bastionhost_user
variable "display_name" {
  description = "Specify the New Created the User's Display Name. Supports up to 128 Characters."
  type        = string
  default     = "tf-testacc-display-name"
}

variable "user_comment" {
  description = "Specify the New of the User That Created the Remark Information. Supports up to 500 Characters."
  type        = string
  default     = "tf-testacc-user-comment"
}

variable "email" {
  description = "Specify the New User's Mailbox."
  type        = string
  default     = "168@aliyun.com"
}

variable "mobile" {
  description = "Specify the New of the User That Created a Different Mobile Phone Number from Your."
  type        = string
  default     = "15566666666"
}

variable "password" {
  description = "Specify the New User's Password. Supports up to 128 Characters. Description of the New User as the Source of the Local User (That Is, Source Value for Local, this Parameter Is Required."
  type        = string
  default     = "YourPassword123!"
}

variable "user_status" {
  description = "The status of the resource. Valid values: Frozen, Normal."
  type        = string
  default     = "Normal"
}

#alicloud_bastionhost_user_group
variable "user_group_name" {
  description = "Specify the New Group Name. Supports up to 128 Characters."
  type        = string
  default     = "tf-testacc-user-group"
}

variable "group_comment" {
  description = "Specify the New Group of Remark Information. Supports up to 500 Characters."
  type        = string
  default     = "tf-testacc-group-comment"
}

#alicloud_bastionhost_host_group
variable "host_group_name" {
  description = "Specify the new host group name. Supports up to 128 characters."
  type        = string
  default     = "tf-testacc-host-group"
}

variable "host_group_comment" {
  description = "Specify the new host group of remark information. Supports up to 500 characters."
  type        = string
  default     = "tf-testacc-host-group-comment"
}

#alicloud_bastionhost_host
variable "host_name" {
  description = "Specify the new host name. Supports up to 128 characters."
  type        = string
  default     = "tf-testacc-host"
}

variable "host_active_address_type" {
  description = "The active address type of the host. Valid values: Private, Public."
  type        = string
  default     = "Private"
}

variable "host_private_address" {
  description = "The private IP address of the host."
  type        = string
  default     = "172.16.0.10"
}

variable "host_os_type" {
  description = "The OS type of the host. Valid values: Linux, Windows."
  type        = string
  default     = "Linux"
}

variable "host_source" {
  description = "The source of the host. Valid values: Local, Ram."
  type        = string
  default     = "Local"
}

#alicloud_bastionhost_host_account
variable "host_account_name" {
  description = "Specify the new host account name. Supports up to 128 characters."
  type        = string
  default     = "tf-testacc-host-account"
}

variable "host_protocol_name" {
  description = "The protocol name of the host account. Valid values: SSH, RDP, VNC."
  type        = string
  default     = "SSH"
}

variable "host_account_password" {
  description = "Specify the new host account password. Supports up to 128 characters."
  type        = string
  default     = "YourPassword123!"
}