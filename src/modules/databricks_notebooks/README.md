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
| [databricks_notebook.lessons](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/notebook) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_notebook_files"></a> [notebook\_files](#input\_notebook\_files) | List of notebook files to upload | `list(string)` | n/a | yes |
| <a name="input_target_folder"></a> [target\_folder](#input\_target\_folder) | Target folder in Databricks workspace | `string` | `"/Workspace/terraform-databricks-trial"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_notebook_paths"></a> [notebook\_paths](#output\_notebook\_paths) | n/a |
