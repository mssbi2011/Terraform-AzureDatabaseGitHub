resource_group_name = "rg-sqldb-uat"
location            = "East US"
sql_server_name     = "sql-server-uat"
sql_database_name   = "sqldb-uat"
admin_username      = "sqladmin"
sku_name            = "S3"
max_size_gb         = 128
zone_redundant      = false
geo_backup_enabled  = true

allowed_ip_ranges = [
  {
    name     = "AllowUATPipeline"
    start_ip = "0.0.0.0"
    end_ip   = "0.0.0.0"
  }
]

tags = {
  environment = "uat"
  project     = "SERVODS"
  managed_by  = "terraform"
}
