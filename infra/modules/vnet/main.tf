# Create virtual networks
# Azure assigns private IP addresses to resources from the address range of the [10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16]
resource "azurerm_virtual_network" "demo08" {
    name                = "vnet-eus-spoke01-${terraform.workspace}"
    address_space       = ["10.50.1.0/24"]
    resource_group_name = var.resource_group_name
    location            = var.location

    tags    = var.default_tags
}

# Create subnet
resource "azurerm_subnet" "demo08-1" {
    name                 = "subnet-spoke01-00"
    resource_group_name  = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.demo08.name
    address_prefixes       = ["10.50.1.0/26"]

}
resource "azurerm_subnet" "demo08-2" {
    name                 = "subnet-spoke01-01"
    resource_group_name  = var.resource_group_name
    virtual_network_name = azurerm_virtual_network.demo08.name
    address_prefixes       = ["10.50.1.64/26"]

}
