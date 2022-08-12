### Display output Linux Vm information
/*
output "VM-Linux-PublicIP" { 
    value = azurerm_public_ip.ggPublicIP[0].ip_address
}
*/
output "vm_name0" {
  description = "Name of the VM"
  value       = azurerm_linux_virtual_machine.gglinuxVM[0].computer_name
}
output "vm_pip0" {
  description = "Public IP of the VM"
  value       = azurerm_linux_virtual_machine.gglinuxVM[0].public_ip_address
}

output "vm_name1" {
  description = "Name of the VM"
  value       = azurerm_linux_virtual_machine.gglinuxVM[1].computer_name
}
output "vm_pip1" {
  description = "Public IP of the VM"
  value       = azurerm_linux_virtual_machine.gglinuxVM[1].public_ip_address
}

/*
output "test_url" {
  description = "Vertiy the result of the provision"
  value       = "start http://${azurerm_linux_virtual_machine.gglinuxVM[count.index].public_ip_address}"
}

output "secret_value" {
  value     = azurerm_key_vault_secret.ggsecret.value
  sensitive = true
}
*/