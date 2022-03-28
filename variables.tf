variable "create_instance" {
  type        = bool
  description = "Whether to create the bastionhost instance."
  default     = false
}

variable "create_user" {
  type        = bool
  description = "Whether to create the specified bastionhost user."
  default     = false
}

variable "create_user_group" {
  type        = bool
  description = "Whether to create the specified bastionhost user_group."
  default     = false
}

variable "create_user_attachment" {
  type        = bool
  description = "Whether to create the specified bastionhost user attachment."
  default     = false
}

variable "instance_id" {
  type        = string
  description = "An existing bastionhost instance id. It will be ignored when create = true"
  default     = ""
}

#alicloud_bastionhost_instance
variable "description" {
  type        = string
  description = "Description of the instance. This name can have a string of 1 to 63 characters."
  default     = null
}
variable "license_code" {
  type        = string
  description = "The package type of Cloud Bastionhost instance. You can query more supported types through the DescribePricingModule."
  default     = null
}

variable "period" {
  type        = number
  description = "Duration for initially producing the instance. Valid values: [1~9], 12, 24, 36. "
  default     = 1
}

variable "vswitch_id" {
  type        = string
  description = "VSwitch ID configured to Bastionhost."
  default     = null
}

variable "security_group_ids" {
  type        = list(string)
  description = " security group IDs configured to Bastionhost. NOTE: There is a potential diff error because of the order of security_group_ids values indefinite. So, from version 1.160.0, security_group_ids type has been updated as set from list, and you can use tolist to convert it to a list."
  default     = null
}

variable "resource_group_id" {
  type        = string
  description = "The Id of resource group which the Bastionhost Instance belongs. If not set, the resource is created in the default resource group."
  default     = null
}

variable "enable_public_access" {
  type        = bool
  description = "Whether to Enable the public internet access to a specified Bastionhost instance. The valid values: true, false"
  default     = false
}


# alicloud_bastionhost_user
variable "user_comment" {
  type        = string
  description = "Specify the New of the User That Created the Remark Information. Supports up to 500 Characters."
  default     = null
}

variable "display_name" {
  type        = string
  description = "Specify the New Created the User's Display Name. Supports up to 128 Characters."
  default     = null
}
variable "email" {
  type        = string
  description = "Specify the New User's Mailbox."
  default     = null
}
variable "mobile" {
  type        = string
  description = "Specify the New of the User That Created a Different Mobile Phone Number from Your."
  default     = null
}

variable "mobile_country_code" {
  type        = string
  description = "Specify the New Create User Mobile Phone Number of the International Domain Name. The Default Value Is the CN. "
  default     = "CN"
}

variable "password" {
  type        = string
  description = "Specify the New User's Password. Supports up to 128 Characters. Description of the New User as the Source of the Local User (That Is, Source Value for Local, this Parameter Is Required."
  default     = null
}

variable "user_source" {
  type        = string
  description = "Specify the New of the User That Created the Source."
  default     = null
}

variable "source_user_id" {
  type        = string
  description = "Specify the Newly Created User Is Uniquely Identified. Indicates That the Parameter Is a Bastion Host Corresponding to the User with the Ram User's Unique Identifier. The Newly Created User Source Grant Permission to a RAM User (That Is, Source Used as a Ram), this Parameter Is Required. You Can Call Access Control of Listusers Interface from the Return Data Userid to Obtain the Parameters."
  default     = null
}

variable "user_status" {
  type        = string
  description = "The status of the resource. Valid values: Frozen, Normal."
  default     = null
}

variable "user_name" {
  type        = string
  description = "Specify the New User Name. This Parameter Is Only by Letters, Lowercase Letters, Numbers, and Underscores (_), Supports up to 128 Characters."
  default     = null
}

# alicloud_bastionhost_user_group
variable "group_comment" {
  type        = string
  description = "Specify the New Group of Remark Information. Supports up to 500 Characters."
  default     = null
}
variable "user_group_name" {
  type        = string
  description = "Specify the New Group Name. Supports up to 128 Characters."
  default     = null
}