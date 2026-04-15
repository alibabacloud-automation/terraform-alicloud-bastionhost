variable "user_name" {
  description = "The name of the bastionhost user."
  type        = string
  default     = "tf-testacc-user"
}

variable "display_name" {
  description = "The display name of the bastionhost user."
  type        = string
  default     = "tf-testacc-display-name"
}

variable "user_comment" {
  description = "The comment of the bastionhost user."
  type        = string
  default     = "tf-testacc-user-comment"
}

variable "email" {
  description = "The email of the bastionhost user."
  type        = string
  default     = "168@aliyun.com"
}

variable "mobile" {
  description = "The mobile of the bastionhost user."
  type        = string
  default     = "15566666666"
}

variable "mobile_country_code" {
  description = "The mobile country code of the bastionhost user."
  type        = string
  default     = "CN"
}

variable "password" {
  description = "The password of the bastionhost user."
  type        = string
  default     = "YourPassword123!"
}

variable "user_status" {
  description = "The status of the bastionhost user. Valid values: Frozen, Normal."
  type        = string
  default     = "Normal"
}

variable "user_group_name" {
  description = "The name of the bastionhost user group."
  type        = string
  default     = "tf-testacc-user-group"
}

variable "group_comment" {
  description = "The comment of the bastionhost user group."
  type        = string
  default     = "tf-testacc-group-comment"
}
