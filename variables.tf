variable "create_instance" {
  description = "Whether to create a bastionhost instance."
  type        = bool
  default     = false
}

variable "existing_instance_id" {
  description = "An existing bastionhost instance id. Used when create_instance = false."
  type        = string
  default     = null
}

variable "instance_config" {
  description = "Configuration for the bastionhost instance."
  type = object({
    vswitch_id           = optional(string)
    security_group_ids   = optional(list(string), [])
    description          = optional(string)
    license_code         = optional(string)
    period               = optional(number, 1)
    resource_group_id    = optional(string)
    enable_public_access = optional(bool, false)
    bandwidth            = optional(string)
    storage              = optional(string)
    plan_code            = optional(string)
  })
  default = {}
}

variable "users" {
  description = "Map of users to create."
  type = map(object({
    display_name        = optional(string)
    comment             = optional(string)
    email               = optional(string)
    mobile              = optional(string)
    mobile_country_code = optional(string, "CN")
    user_name           = optional(string)
    password            = optional(string)
    source              = optional(string)
    source_user_id      = optional(string)
    status              = optional(string, "Normal")
    create_attachment   = optional(bool, false)
  }))
  default = {}
}

variable "create_user_group" {
  description = "Whether to create a bastionhost user group."
  type        = bool
  default     = false
}

variable "existing_user_group_id" {
  description = "An existing bastionhost user group id. Used when create_user_group = false."
  type        = string
  default     = null
}

variable "user_group_config" {
  description = "Configuration for the bastionhost user group."
  type = object({
    user_group_name = optional(string)
    comment         = optional(string)
  })
  default = {}
}

variable "create_host_group" {
  description = "Whether to create a bastionhost host group."
  type        = bool
  default     = false
}

variable "existing_host_group_id" {
  description = "An existing bastionhost host group id. Used when create_host_group = false."
  type        = string
  default     = null
}

variable "host_group_config" {
  description = "Configuration for the bastionhost host group."
  type = object({
    host_group_name = optional(string)
    comment         = optional(string)
  })
  default = {}
}

variable "hosts" {
  description = "Map of hosts to create. Each host can have multiple accounts."
  type = map(object({
    host_name            = string
    active_address_type  = optional(string, "Private")
    host_private_address = string
    os_type              = optional(string, "Linux")
    source               = optional(string, "Local")
    create_attachment    = optional(bool, false)
    accounts = optional(map(object({
      host_account_name = optional(string)
      protocol_name     = optional(string, "SSH")
      password          = optional(string)
    })), {})
  }))
  default = {}
}
