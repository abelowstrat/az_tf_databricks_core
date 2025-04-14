variable "workspace_id" {
  description = "ID of the Databricks workspace"
  type        = string
}

variable "metastore_id" {
  description = "ID of the existing Databricks metastore"
  type        = string
}

variable "databricks_storage_credential" {
  description = "The storage credentials for the Databricks workspace"
  type        = string
}

variable "external_location" {
  description = "The location of the external storage"
  type        = string
}

variable "access_connector_id" {
  description = "ID of the Databricks access connector"
  type        = string
}
