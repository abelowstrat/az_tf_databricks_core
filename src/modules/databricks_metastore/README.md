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
| [databricks_external_location.some](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/external_location) | resource |
| [databricks_grants.external_creds](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/grants) | resource |
| [databricks_metastore_assignment.metastore_assignment](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/metastore_assignment) | resource |
| [databricks_storage_credential.external](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/storage_credential) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_connector_id"></a> [access\_connector\_id](#input\_access\_connector\_id) | ID of the Databricks access connector | `string` | n/a | yes |
| <a name="input_databricks_storage_credential"></a> [databricks\_storage\_credential](#input\_databricks\_storage\_credential) | The storage credentials for the Databricks workspace | `string` | n/a | yes |
| <a name="input_external_location"></a> [external\_location](#input\_external\_location) | The location of the external storage | `string` | n/a | yes |
| <a name="input_metastore_id"></a> [metastore\_id](#input\_metastore\_id) | ID of the existing Databricks metastore | `string` | n/a | yes |
| <a name="input_workspace_id"></a> [workspace\_id](#input\_workspace\_id) | ID of the Databricks workspace | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_location_id"></a> [external\_location\_id](#output\_external\_location\_id) | ID of the external location |
| <a name="output_metastore_assignment_id"></a> [metastore\_assignment\_id](#output\_metastore\_assignment\_id) | ID of the metastore assignment |
| <a name="output_storage_credential_id"></a> [storage\_credential\_id](#output\_storage\_credential\_id) | ID of the storage credential |
