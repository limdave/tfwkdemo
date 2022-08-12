# terraform 상태값을 저장할 스토리지를 개별적으로 구성한 후에, 실제 배포할 리소스를 생성한다
# Terraform 구성파일에 Azure 구독 자격증명을 저장하지 않아야 한다. Azure CLI환경에서 az login 후에 az account show로 자신의 구독을 확인한다
# 본 파일을 별도로 선행하여 실행한다

# Declare of the Provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.0"                 #2022.07.13기준 --> latest v3.13.0
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.1.0"
    }
  }
    # Use backed locally first. Commenting out this after configuring remote backend.
    backend "local" {
      path = "./terraform.tfstate"
    } 
}

provider "azurerm" {
  features {
      key_vault {
        purge_soft_delete_on_destroy = true   #Defaults to true.
    }
  }
  # This is a Authentication info. So you don't write it.
  #subscription_id   = "<azure_subscription_id>"
  #tenant_id         = "<azure_subscription_tenant_id>"
  #client_id         = "<service_principal_appid>"     #노출되지 않도록 구성
  #client_secret     = "<service_principal_password>"  #노출되지 않도록 구성
}

#backend 설정전에 스토리지가 먼저 만들어져야 한다.
# Create a resource group / you have to change the name and location
resource "azurerm_resource_group" "backend" {
  name     = "RG-tfstate-${formatdate("YYYYMMDD",timestamp())}"
  location = "koreacentral"
  tags = {
    created = "${timeadd(timestamp(),"9h")}"
    owner = "gslim"
  }
}

# Generate random text for a unique storage account name
resource "random_string" "random" {
    length  = 5
    special = false
    upper   = false
}

# Create storage account for terraform status information
resource "azurerm_storage_account" "tfstate" {
    name                        = "tfstate${random_string.random.result}"
    resource_group_name         = azurerm_resource_group.backend.name
    location                    = azurerm_resource_group.backend.location
    account_tier                = "Standard"
    account_replication_type    = "LRS"

    tags = {
        created = "${timeadd(timestamp(),"9h")}"
        owner = "gslim"
    }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "blob"
}

#---------------------------------------------------------------------------------------
output "backend_rg_name" {
  description = "Name of the resource group name for terraform backend state"
  value       = azurerm_resource_group.backend.name
}

output "backend_storage_account" {
  description = "Name of the backend storage account name"
  value       = azurerm_storage_account.tfstate.name
}