# Azure SQL Single Database - SERVODS

## Introduction

This repository contains Terraform infrastructure-as-code for deploying Azure SQL Single Databases across multiple environments (dev, qa, uat, prod) using Azure DevOps Pipelines.

## Getting Started

### Prerequisites

- [Terraform](https://www.terraform.io/downloads) >= 1.5.0
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- Azure DevOps project with service connections configured

### Repository Structure

```
.
├── .github/
├── Azure/
│   └── SQLDB-SERVODS/
│       ├── azure-pipeline.yaml   # Azure DevOps pipeline
│       ├── backend.tf            # Remote state configuration
│       ├── data.tf               # Data sources
│       ├── main.tf               # Core resources
│       ├── outputs.tf            # Output values
│       ├── variables.tf          # Variable definitions
│       ├── dev.tfvars            # Dev environment values
│       ├── qa.tfvars             # QA environment values
│       ├── uat.tfvars            # UAT environment values
│       └── prod.tfvars           # Prod environment values
└── README.md
```

### Environments

| Environment | SKU | Storage | Zone Redundant |
|-------------|-----|---------|----------------|
| uat         | S3  | 128 GB  | No             |
| prod        | P1  | 256 GB  | Yes            |

## GitHub Actions Setup

1. Go to your GitHub repo → **Settings → Environments** and create two environments:
   - `uat`
   - `prod`

2. Add the following **secrets** to each environment:

   | Secret | Description |
   |--------|-------------|
   | `UAT_ARM_CLIENT_ID` | Service Principal Client ID for UAT |
   | `UAT_ARM_CLIENT_SECRET` | Service Principal Secret for UAT |
   | `UAT_ARM_SUBSCRIPTION_ID` | Azure Subscription ID for UAT |
   | `UAT_ARM_TENANT_ID` | Azure Tenant ID for UAT |
   | `PROD_ARM_CLIENT_ID` | Service Principal Client ID for Prod |
   | `PROD_ARM_CLIENT_SECRET` | Service Principal Secret for Prod |
   | `PROD_ARM_SUBSCRIPTION_ID` | Azure Subscription ID for Prod |
   | `PROD_ARM_TENANT_ID` | Azure Tenant ID for Prod |
   | `SQL_ADMIN_PASSWORD` | SQL Server admin password (repo-level secret) |

3. Update the following variables at the top of `.github/workflows/deploy.yml`:
   - `BACKEND_RESOURCE_GROUP`
   - `BACKEND_STORAGE_ACCOUNT`
   - `BACKEND_CONTAINER`

## Deployment Flow

```
Validate → UAT → Prod
```

Triggered automatically on push to `main`, or manually via workflow_dispatch.
