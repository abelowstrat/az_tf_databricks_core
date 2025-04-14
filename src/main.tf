terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.14.0"
    }
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "ab_dna_dev"
    storage_account_name = "abdevdbstate"
    container_name       = "dev"
    key                  = "databricks-genai-platform-state/terraform.tfstate"
  }
}

# primary provider
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# If you have resources in a different subscription, use a secondary provider with aliasing to reference the resources correctly. 

# Retrieve secrets from Azure Key Vault
data "azurerm_key_vault" "example" {
  provider            = azurerm
  name                = var.key_vault_name
  resource_group_name = var.key_vault_resource_group
}

data "azurerm_key_vault_secret" "service_principal_client_id" {
  provider     = azurerm
  name         = "databricks-client-id"
  key_vault_id = data.azurerm_key_vault.example.id
}

data "azurerm_key_vault_secret" "service_principal_client_secret" {
  provider     = azurerm
  name         = "databricks-client-secret"
  key_vault_id = data.azurerm_key_vault.example.id
}

data "azurerm_key_vault_secret" "azure_tenant_id" {
  provider     = azurerm
  name         = "tenant-id"
  key_vault_id = data.azurerm_key_vault.example.id
}

# Resource Group
resource "azurerm_resource_group" "databricks_training_rg" {
  name     = var.resource_group_name
  location = var.location # Replace with your preferred region
}

# Databricks Workspace
resource "azurerm_databricks_workspace" "databricks_workspace" {
  name                = var.workspace_name
  resource_group_name = azurerm_resource_group.databricks_training_rg.name
  location            = azurerm_resource_group.databricks_training_rg.location
  sku                 = var.workspace_sku # Options: "standard", "premium"
}

# Databricks Provider
provider "databricks" {
  host                        = azurerm_databricks_workspace.databricks_workspace.workspace_url
  azure_workspace_resource_id = azurerm_databricks_workspace.databricks_workspace.id
  azure_client_id             = data.azurerm_key_vault_secret.service_principal_client_id.value
  azure_client_secret         = data.azurerm_key_vault_secret.service_principal_client_secret.value
  azure_tenant_id             = data.azurerm_key_vault_secret.azure_tenant_id.value
}

### --- Token --- ###
# Access Token for Databricks
resource "databricks_token" "access_token" {
  comment    = "Token for Terraform-managed cluster"
  depends_on = [azurerm_databricks_workspace.databricks_workspace]
}


###--- Modules --- ###

#-- Clusters
module "databricks_clusters" {
  count                           = var.deploy_databricks_clusters ? 1 : 0
  source                          = "./modules/databricks_clusters"
  ml_cluster_name                 = var.ml_cluster_name
  small_cluster_name              = var.small_cluster_name
  cluster_autotermination_minutes = var.cluster_autotermination_minutes
  cluster_num_workers             = var.cluster_num_workers
  node_type                       = var.node_type
  cluster_data_security_mode      = var.cluster_data_security_mode
  single_user_name                = var.single_user_name
  depends_on                      = [databricks_token.access_token]
}

#-- Metastore
# Retrieve the Access Connector ID
# data "azurerm_databricks_access_connector" "example" {
#   name                = var.access_connector_name
#   resource_group_name = "databricks-rg-${var.resource_group_name}"
# }

module "databricks_metastore" {
  count                         = var.deploy_databricks_metastore ? 1 : 0
  source                        = "./modules/databricks_metastore"
  workspace_id                  = azurerm_databricks_workspace.databricks_workspace.workspace_id
  metastore_id                  = var.metastore_id
  databricks_storage_credential = var.databricks_storage_credential
  external_location             = var.external_location
  access_connector_id           = azurerm_databricks_workspace.databricks_workspace.access_connector_id
  depends_on                    = [azurerm_databricks_workspace.databricks_workspace]
}

#-- Repos
module "databricks_repos" {
  count                 = var.deploy_databricks_repos ? 1 : 0
  source                = "./modules/databricks_repos"
  git_username          = var.git_username
  personal_access_token = var.personal_access_token
  repo_url              = var.repo_url
  repo_path             = var.repo_path
  depends_on            = [azurerm_databricks_workspace.databricks_workspace]
}
#-- Notebooks
# Create a notebook directory in the workspace
resource "databricks_directory" "target_folder" {
  count      = var.include_databricks_notebooks ? 1 : 0
  path       = "/Workspace/terraform-databricks-trial"
  depends_on = [azurerm_databricks_workspace.databricks_workspace]
}
# Retrieve the path of the directory
data "databricks_notebook_paths" "target_folder" {
  count      = var.include_databricks_notebooks ? 1 : 0
  path       = "/Workspace/terraform-databricks-trial"
  recursive  = false
  depends_on = [databricks_directory.target_folder]
}
# import the notebooks from the local filesystem
module "databricks_notebooks" {
  source         = "./modules/databricks_notebooks"
  count          = var.include_databricks_notebooks ? 1 : 0
  notebook_files = fileset("${path.module}/modules/databricks_notebooks/notebooks", "*.zip")
  target_folder  = data.databricks_notebook_paths.target_folder[count.index].path
  depends_on     = [data.databricks_notebook_paths.target_folder]
}

#-- Catalog
module "databricks_catalog" {
  count        = var.deploy_databricks_catalog ? 1 : 0
  source       = "./modules/databricks_catalog"
  catalog_name = var.catalog_name
  schema_name  = var.schema_name
}

#--- Outputs
output "workspace_url" {
  value = azurerm_databricks_workspace.databricks_workspace.workspace_url
}
