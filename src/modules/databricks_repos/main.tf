resource "databricks_git_credential" "this" {
  git_username          = var.git_username
  personal_access_token = var.personal_access_token
  git_provider          = var.git_provider    # or "azureDevOpsServices", "gitLab", etc.
  force = true
}

resource "databricks_repo" "repo" {
  git_provider = var.git_provider  
  url = var.repo_url
  path = var.repo_path
}

