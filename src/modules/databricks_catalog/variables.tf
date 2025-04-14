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