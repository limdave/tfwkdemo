variable "base_name" {
    type = string
    description = "The storage accuont base name"
}

variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
}

variable "location" {
    type = string
    description = "The location for the deployment"
}

variable "default_tags" {
  description = "please define a tag name like date, role, environment and etc"
    type = map(string)
    default = {
        Envrionment = "test",
        datetime  = "2022.08.12 22:30",
        Creator   = "gslim"
    }
}

variable "instances_num" {
  description = "Specify the number of vm instances."
  type        = number
  default     = 1
}

variable "hub_vnet" {
  description = "The Private IP range for Hub Vritual Network."
  default = ["10.10.0.0/16"]
}

variable "spoke1_vnet" {
  description = "The Private IP range for Spoke 01 Vritual Network."
  default = ["10.11.0.0/16"]
}

variable "admin_username" {
  description = "administrator name for created VM"
  default     = "ggadmin"
}

variable "admin_password" {
  description = "administrator password (recommended to disable password auth)"
  #default     = "1234!"
}

