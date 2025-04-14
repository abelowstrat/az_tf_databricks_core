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
}

variable "git_provider" {
  description = "The Git provider"
  type        = string
  default     = "gitHub"
}
