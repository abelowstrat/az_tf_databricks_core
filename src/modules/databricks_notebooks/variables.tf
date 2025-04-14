variable "notebook_files" {
  description = "List of notebook files to upload"
  type        = list(string)
}

variable "target_folder" {
  description = "Target folder in Databricks workspace"
  type        = string
  default = "/Workspace/terraform-databricks-trial"
}