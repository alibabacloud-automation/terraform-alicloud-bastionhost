#alicloud_bastionhost_instance
variable "create_instance" {
  description = "Whether to create the bastionhost instance."
  type        = bool
  default     = false
}

variable "vswitch_id" {
  description = "VSwitch ID configured to Bastionhost."
  type        = string
  default     = ""
}

variable "security_group_ids" {
  description = "security group IDs configured to Bastionhost. NOTE: There is a potential diff error because of the order of security_group_ids values indefinite. So, from version 1.160.0, security_group_ids type has been updated as set from list, and you can use tolist to convert it to a list."
  type        = list(string)
  default     = []
}

variable "description" {
  description = "Description of the instance. This name can have a string of 1 to 63 characters."
  type        = string
  default     = ""
}

variable "license_code" {
  description = "The package type of Cloud Bastionhost instance. You can query more supported types through the DescribePricingModule."
  type        = string
  default     = ""
}

variable "period" {
  description = "Duration for initially producing the instance. Valid values: [1~9], 12, 24, 36."
  type        = number
  default     = 1
}

variable "resource_group_id" {
  description = "The Id of resource group which the Bastionhost Instance belongs. If not set, the resource is created in the default resource group."
  type        = string
  default     = ""
}

variable "enable_public_access" {
  description = "Whether to Enable the public internet access to a specified Bastionhost instance. The valid values: true, false."
  type        = bool
  default     = false
}

variable "bandwidth" {
  description = "The bandwidth of Cloud Bastionhost instance. If China-Site Account, its valid values: 0 to 150. Unit: Mbit/s. The value must be a multiple of 5. If International-Site Account, its valid values: 0 to 200. Unit: Mbit/s. The value must be a multiple of 10."
  type        = string
  default     = ""
}

variable "storage" {
  description = "The storage of Cloud Bastionhost instance. Valid values: 0 to 500. Unit: TB."
  type        = string
  default     = ""
}

variable "plan_code" {
  description = "The plan code of Cloud Bastionhost instance. Valid values: cloudbastion: Basic Edition; cloudbastion_ha: HA Edition."
  type        = string
  default     = ""
}

#alicloud_bastionhost_user
variable "create_user" {
  description = "Whether to create the specified bastionhost user."
  type        = bool
  default     = false
}

variable "instance_id" {
  description = "An existing bastionhost instance id. It will be ignored when create_instance = true."
  type        = string
  default     = ""
}

variable "display_name" {
  description = "Specify the New Created the User's Display Name. Supports up to 128 Characters."
  type        = string
  default     = ""
}

variable "user_comment" {
  description = "Specify the New of the User That Created the Remark Information. Supports up to 500 Characters."
  type        = string
  default     = ""
}

variable "email" {
  description = "Specify the New User's Mailbox."
  type        = string
  default     = ""
}

variable "mobile" {
  description = "Specify the New of the User That Created a Different Mobile Phone Number from Your."
  type        = string
  default     = ""
}

variable "mobile_country_code" {
  description = "Specify the New Create User Mobile Phone Number of the International Domain Name. The Default Value Is the CN."
  type        = string
  default     = "CN"
}

variable "user_name" {
  description = "Specify the New User Name. This Parameter Is Only by Letters, Lowercase Letters, Numbers, and Underscores (_), Supports up to 128 Characters."
  type        = string
  default     = ""
}

variable "password" {
  description = "Specify the New User's Password. Supports up to 128 Characters. Description of the New User as the Source of the Local User (That Is, Source Value for Local, this Parameter Is Required."
  type        = string
  default     = ""
}

variable "user_source" {
  description = "Specify the New of the User That Created the Source."
  type        = string
  default     = ""
}

variable "source_user_id" {
  description = "Specify the Newly Created User Is Uniquely Identified. Indicates That the Parameter Is a Bastion Host Corresponding to the User with the Ram User's Unique Identifier. The Newly Created User Source Grant Permission to a RAM User (That Is, Source Used as a Ram), this Parameter Is Required. You Can Call Access Control of Listusers Interface from the Return Data Userid to Obtain the Parameters."
  type        = string
  default     = ""
}

variable "user_status" {
  description = "The status of the resource. Valid values: Frozen, Normal."
  type        = string
  default     = "Normal"
}

#alicloud_bastionhost_user_group
variable "create_user_group" {
  description = "Whether to create the specified bastionhost user_group."
  type        = bool
  default     = false
}

variable "user_group_name" {
  description = "Specify the New Group Name. Supports up to 128 Characters."
  type        = string
  default     = ""
}

variable "group_comment" {
  description = "Specify the New Group of Remark Information. Supports up to 500 Characters."
  type        = string
  default     = ""
}

#alicloud_bastionhost_user_attachment
variable "create_user_attachment" {
  description = "Whether to create the specified bastionhost user attachment."
  type        = bool
  default     = false
}
