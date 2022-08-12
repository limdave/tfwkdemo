# This a examples from "https://github.com/hashicorp/terraform-provider-azurerm/tree/main/examples"

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
  default = "rg-demo08"   
}

variable "location" {
  description = "The name of the location name in which to create the virtual network."
  default = "eastus"    #koreacentral, koreasouth
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
  default     = 2
}

variable "hub_vnet" {
  description = "The Private IP range for Hub Vritual Network."
  default = ["10.50.0.0/16"]
}

variable "spoke1_vnet" {
  description = "The Private IP range for Spoke 01 Vritual Network."
  default = ["10.51.0.0/16"]
}

variable "admin_username" {
  description = "admin name for created Linux VM"
  default     = "ggadm"
}

variable "admin_usernameW" {
  description = "administrator name for created Windows VM"
  default     = "ggadmin"
}

variable "admin_password" {
  description = "administrator password (recommended to disable password auth)"
  default     = "gspassword"
}

variable "hostname" {
  description = "Virtual machine hostname. Used for local hostname, DNS, and storage-related names."
  default     = "tf-linuxvm-httpd"
}

variable "kv_rgname" {
  description = "Azure Key Valut RG name"
  default     = "rg-gav2022-gslim"
}

variable "kv_name" {
  description = "Azure Key Valut name"
  default     = "kv1gslim"
}

variable "kv_secretname" {
  description = "Azure Key Valut Secret name"
  default     = "pw4ggdemo"
}
