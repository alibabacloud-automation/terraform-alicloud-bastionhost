#alicloud_bastionhost_instance
variable "description" {
  type        = string
  description = "Description of the instance. This name can have a string of 1 to 63 characters."
  default     = "tf_testAcc"
}

#alicloud_bastionhost_user
variable "license_code" {
  type        = string
  description = "The package type of Cloud Bastionhost instance. You can query more supported types through the DescribePricingModule."
  default     = "bhah_ent_50_asset"
}

variable "password" {
  type        = string
  description = "Specify the New User's Password. Supports up to 128 Characters. Description of the New User as the Source of the Local User (That Is, Source Value for Local, this Parameter Is Required."
  default     = "tf-testAcc-oAupFqRaH24MdOSrsIKsu3qw"
}

variable "user_comment" {
  type        = string
  description = "Specify the New of the User That Created the Remark Information. Supports up to 500 Characters."
  default     = "tf-testAcc-mrPFCPi3MuIloLzTvVzQbUbs"
}

variable "email" {
  type        = string
  description = "Specify the New User's Mailbox."
  default     = "tf-testAcc-5V8AgQKKw389irWIePb47aOq@aliyun.com"
}

variable "display_name" {
  type        = string
  description = "Specify the New Created the User's Display Name. Supports up to 128 Characters."
  default     = "tf-testAcc-RZEdvPXF9A3w3ArhFwuAfUoY"
}

variable "mobile_country_code" {
  type        = string
  description = "Specify the New Create User Mobile Phone Number of the International Domain Name. The Default Value Is the CN. "
  default     = "HK"
}
#alicloud_bastionhost_user_group
variable "group_comment" {
  type        = string
  description = "Specify the New Group of Remark Information. Supports up to 500 Characters."
  default     = "tf-testAcc-6ke&*Cfo/6lOS@jj.o#KRgf"
}

variable "user_group_name" {
  type        = string
  description = "Specify the New Group Name. Supports up to 128 Characters."
  default     = "tf-testAcc-0T2Sep=samLLheEIbZ"
}