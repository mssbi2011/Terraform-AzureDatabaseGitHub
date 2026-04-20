resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password

  tags = var.tags
}

resource "azurerm_mssql_database" "sql_db" {
  name           = var.sql_database_name
  server_id      = azurerm_mssql_server.sql_server.id
  sku_name       = var.sku_name
  max_size_gb    = var.max_size_gb
  zone_redundant = var.zone_redundant
  geo_backup_enabled = var.geo_backup_enabled

  tags = var.tags
}

resource "azurerm_mssql_firewall_rule" "firewall_rules" {
  for_each = { for rule in var.allowed_ip_ranges : rule.name => rule }

  name             = each.value.name
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = each.value.start_ip
  end_ip_address   = each.value.end_ip
}
