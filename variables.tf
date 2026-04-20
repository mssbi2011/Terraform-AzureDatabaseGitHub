variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "East US"
}

variable "sql_server_name" {
  description = "Name of the Azure SQL Server"
  type        = string
}

variable "sql_database_name" {
  description = "Name of the Azure SQL Database"
  type        = string
}

variable "admin_username" {
  description = "SQL Server administrator username"
  type        = string
}

variable "admin_password" {
  description = "SQL Server administrator password"
  type        = string
  sensitive   = true
}

variable "sku_name" {
  description = "SKU for the SQL Database (e.g. S0, S1, GP_S_Gen5_2, P1)"
  type        = string
  default     = "S1"
}

variable "max_size_gb" {
  description = "Maximum size of the database in GB"
  type        = number
  default     = 32
}

variable "zone_redundant" {
  description = "Whether the database is zone redundant"
  type        = bool
  default     = false
}

variable "geo_backup_enabled" {
  description = "Whether geo-backup is enabled"
  type        = bool
  default     = true
}

variable "allowed_ip_ranges" {
  description = "List of IP ranges allowed through the SQL Server firewall"
  type = list(object({
    name     = string
    start_ip = string
    end_ip   = string
  }))
  default = []
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
