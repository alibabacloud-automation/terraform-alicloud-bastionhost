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