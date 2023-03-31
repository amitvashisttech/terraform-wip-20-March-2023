output "my_public_ip_details" {
   value = "${azurerm_public_ip.example}"
}



output "my_public_ip" {
   value = "${azurerm_public_ip.example.ip_address}"
}
