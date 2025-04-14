## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_databricks"></a> [databricks](#provider\_databricks) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [databricks_git_credential.this](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/git_credential) | resource |
| [databricks_repo.repo](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/repo) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_git_provider"></a> [git\_provider](#input\_git\_provider) | The Git provider | `string` | `"gitHub"` | no |
| <a name="input_git_username"></a> [git\_username](#input\_git\_username) | The username for the Git repository | `string` | n/a | yes |
| <a name="input_personal_access_token"></a> [personal\_access\_token](#input\_personal\_access\_token) | The personal access token for the Git repository | `string` | n/a | yes |
| <a name="input_repo_path"></a> [repo\_path](#input\_repo\_path) | The path in the Databricks workspace where the repo will be cloned | `string` | n/a | yes |
| <a name="input_repo_url"></a> [repo\_url](#input\_repo\_url) | The URL of the GitHub repository | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repo_id"></a> [repo\_id](#output\_repo\_id) | The ID of the Databricks repo |
