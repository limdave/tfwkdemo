variable "terraform_workspace" {
    type = string
    description = "The storage accuont base name"
}

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