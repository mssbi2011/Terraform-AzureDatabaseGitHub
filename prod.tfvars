resource_group_name = "rg-sqldb-prod"
location            = "East US"
sql_server_name     = "sql-server-prod"
sql_database_name   = "sqldb-prod"
admin_username      = "sqladmin"
sku_name            = "P1"
max_size_gb         = 256
zone_redundant      = true
geo_backup_enabled  = true

allowed_ip_ranges = [
  {
    name     = "AllowProdPipeline"
    start_ip = "0.0.0.0"
    end_ip   = "0.0.0.0"
  }
]

tags = {
  environment = "prod"
  project     = "SERVODS"
  managed_by  = "terraform"
}
