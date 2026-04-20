terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    # Supplied via pipeline -backend-config flags
    # resource_group_name  = set in pipeline
    # storage_account_name = set in pipeline
    # container_name       = set in pipeline
    # key                  = e.g. sqldb-dev.tfstate
  }
}

provider "azurerm" {
  features {}
}
