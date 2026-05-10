output "appgw_id" {
  value = azurerm_application_gateway.appgw.id
}

output "public_ip" {
  value = azurerm_public_ip.appgw_pip.ip_address
}

output "backend_pool_name" {
  value = "backend-pool"
}

output "backend_pool_id" {
  value = [
    for pool in azurerm_application_gateway.appgw.backend_address_pool :
    pool.id if pool.name == "backend-pool"
  ][0]
}