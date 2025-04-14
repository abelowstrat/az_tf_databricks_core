## --- Deployment variables --- ## set to true to deploy the module or false to skip it

variable "deploy_databricks_repos" {
  description = "Set to true to deploy Module A"
  type        = bool
  default     = true
}

variable "deploy_databricks_clusters" {
  description = "Set to true to deploy Module A"
  type        = bool
  default     = true
}

variable "deploy_databricks_metastore" {
  description = "Whether to include the Databricks Notebooks module"
  type        = bool
  default     = false
}

variable "deploy_databricks_catalog" {
  description = "Whether to include the Databricks Catalog module"
  type        = bool
  default     = false
}

variable "include_databricks_notebooks" {
  description = "Whether to include the Databricks Notebooks module"
  type        = bool
  default     = false
}


