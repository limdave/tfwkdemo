### Display output dev environment

#---------------------------------------------------------------------------------------
output "dev_rg_name" {
  description = "Name of the resource group name for dev environment"
  value       = azurerm_resource_group.demo08.name
}