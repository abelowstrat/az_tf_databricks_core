# Sensitive Variables (use terraform.tfvars, key vault, environment variables or other secure method to pass these values)
# Not used here since the parameters are retrieved as data in main.tf using service principal for authentication
# variable "service_principal_client_id" {
#   description = "Client ID for the Azure service principal"
#   sensitive   = true # will not display in terraform output
# }

# variable "service_principal_client_secret" {
#   description = "Client secret for the Azure service principal"
#   sensitive   = true
# }

### --- Tenant Level Variables --- ###
variable "azure_tenant_id" {
  description = "Azure Active Directory tenant ID"
  sensitive   = true
}

variable "subscription_id" {
  description = "Azure Subscription ID"
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  default     = "databricks-training-rg" # set the resource group name here
}

variable "tenant_id" {
  type = string
  description = "Azure Active Directory tenant ID"
}

### --- Databricks Workspace --- ###
variable "databricks_service_principal_display_name" {
  type        = string
  description = "A workspace display name for the Azure Databricks service principal."
  default = "databricks_sp"
}

variable "workspace_sku" {
  description = "SKU for the Databricks workspace"
  default     = "premium" # "trial", "standard", or "premium" 
}

variable "workspace_name" {
  description = "Name of the Databricks Workspace"
  default     = "databricks-training-ws" # set the workspace name here
}

variable "location" {
  description = "Azure region for all resources"
  default     = "West Europe" # set your preferred region here
}
### --- Clusters --- ###
variable "ml_cluster_name" {}
variable "small_cluster_name" {}
variable "cluster_autotermination_minutes" {}
variable "cluster_num_workers" {}
variable "node_type" {}
variable "cluster_data_security_mode" {}
variable "single_user_name" {
  description = "Username for the single user"
}


### --- Metastore --- ###
variable "metastore_id" {
  description = "ID of the existing Databricks metastore"
  type        = string
}

variable "external_location" {
  description = "The location of the external storage"
  type        = string
}

variable "databricks_storage_credential" {
  description = "The storage credentials for the Databricks workspace"
  type        = string
  default = "default"
}

variable "access_connector_name" {
  description = "Name of the Databricks access connector where we retrieve the id from"
  type        = string
  default     = "unity-catalog-access-connector"
}


### --- Repos and Git --- ###
variable "git_provider" {
  description = "The username for the Git repository"
  type        = string  
}

variable "repo_url" {
  description = "The URL of the GitHub repository"
  type        = string
}

variable "repo_path" {
  description = "The path in the Databricks workspace where the repo will be cloned"
  type        = string
}

variable "git_username" {
  description = "The username for the Git repository"
  type        = string  
}

variable "personal_access_token" {
  description = "The personal access token for the Git repository"
  type        = string
  sensitive   = true
}
### --- Azure Key Vault --- ###
variable "key_vault_name" {
  description = "Name of the Azure Key Vault"
  default     = "abdevkv" # set the key vault name here
}

variable "key_vault_resource_group" {
  description = "Name of the Azure Resource Group for the Key Vault"
  default     = "ab_pbi_embedded_dev" # set the key vault resource group here
}

### --- Databricks Catalog --- ###
variable "catalog_name" {
  description = "Name of the Databricks catalog"
  type        = string
  default     = "main"
}

variable "schema_name" {
  description = "Name of the Databricks schema"
  type        = string
  default     = "genai"
}

