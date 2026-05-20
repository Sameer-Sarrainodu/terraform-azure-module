output "appgw_id" {
  value = azurerm_application_gateway.appgw.id
}

output "frontend_ip" {
  value = var.is_public ? azurerm_public_ip.appgw_pip[0].ip_address : var.private_ip
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