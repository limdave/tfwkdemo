### Display output dev environment

#---------------------------------------------------------------------------------------
output "backend_rg_name" {
  description = "Name of the resource group name for dev environment"
  value       = azurerm_resource_group.demo08.name
}