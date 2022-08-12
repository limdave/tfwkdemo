
# Generate random text for a unique storage account name
resource "random_string" "random" {
    length  = 6
    special = false
    upper   = false
}

resource "azurerm_storage_account" "demo08" {
  name                     = "${lower(var.terraform.workspace)}${random_string.random.result}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.default_tags  
}