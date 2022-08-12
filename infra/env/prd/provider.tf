# Terraform 상태를 Azure Storage에 저장(협업하거나 중요정보 통제목적) : https://docs.microsoft.com/ko-kr/azure/developer/terraform/store-state-in-azure-storage?tabs=terraform
# Terraform 상태를 저장하기 위해 Azure 스토리지 계정에 대한 퍼블릭 액세스가 허용됩니다.
# Azure Storage를 백 엔드로 사용하기 전에 스토리지 계정을 만들어야 합니다.
# Terraform 구성파일에 Azure 구독 자격증명을 저장하지 않아야 한다. Azure CLI환경에서 az login 후에 az account show로 자신의 구독을 확인한다

# Declare of the Provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>3.0"                 #2022.07.13기준 --> latest v3.13.0
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.3.2"
    }
  }
    #backend "azurerm" {
    #    resource_group_name  = "cloud-shell-storage-southeastasia"
    #    storage_account_name = "cs11003200094ea6d93"
    #    container_name       = "tfstate"
    #    key                  = "terraform_3tier.tfstate"
    #}
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

/*backend 설정전에 스토리지가 먼저 만들어져야 한다.
# Generate random text for a unique storage account name
resource "random_id" "randomId" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group = azurerm_resource_group.ggResourcegroup.name
    }

    byte_length = 8
}

# Create storage account for terraform status information
resource "azurerm_storage_account" "tfstate" {
    name                        = "tfstate${random_id.randomId.hex}"
    resource_group_name         = azurerm_resource_group.ggResourcegroup.name
    location                    = var.location
    account_tier                = "Standard"
    account_replication_type    = "LRS"
    #allow_blob_public_access    = true

    tags = var.default_tags
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "blob"
}
*/