## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.14.0 |
| <a name="requirement_databricks"></a> [databricks](#requirement\_databricks) | ~> 1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.14.0 |
| <a name="provider_databricks"></a> [databricks](#provider\_databricks) | 1.64.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_databricks_catalog"></a> [databricks\_catalog](#module\_databricks\_catalog) | ./modules/databricks_catalog | n/a |
| <a name="module_databricks_clusters"></a> [databricks\_clusters](#module\_databricks\_clusters) | ./modules/databricks_clusters | n/a |
| <a name="module_databricks_metastore"></a> [databricks\_metastore](#module\_databricks\_metastore) | ./modules/databricks_metastore | n/a |
| <a name="module_databricks_notebooks"></a> [databricks\_notebooks](#module\_databricks\_notebooks) | ./modules/databricks_notebooks | n/a |
| <a name="module_databricks_repos"></a> [databricks\_repos](#module\_databricks\_repos) | ./modules/databricks_repos | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_databricks_workspace.databricks_workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/databricks_workspace) | resource |
| [azurerm_resource_group.databricks_training_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [databricks_directory.target_folder](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/directory) | resource |
| [databricks_token.access_token](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/token) | resource |
| [azurerm_key_vault.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_key_vault_secret.azure_tenant_id](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_key_vault_secret.service_principal_client_id](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_key_vault_secret.service_principal_client_secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [databricks_notebook_paths.target_folder](https://registry.terraform.io/providers/databricks/databricks/latest/docs/data-sources/notebook_paths) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_connector_name"></a> [access\_connector\_name](#input\_access\_connector\_name) | Name of the Databricks access connector where we retrieve the id from | `string` | `"unity-catalog-access-connector"` | no |
| <a name="input_azure_tenant_id"></a> [azure\_tenant\_id](#input\_azure\_tenant\_id) | Azure Active Directory tenant ID | `any` | n/a | yes |
| <a name="input_catalog_name"></a> [catalog\_name](#input\_catalog\_name) | Name of the Databricks catalog | `string` | `"main"` | no |
| <a name="input_cluster_autotermination_minutes"></a> [cluster\_autotermination\_minutes](#input\_cluster\_autotermination\_minutes) | n/a | `any` | n/a | yes |
| <a name="input_cluster_data_security_mode"></a> [cluster\_data\_security\_mode](#input\_cluster\_data\_security\_mode) | n/a | `any` | n/a | yes |
| <a name="input_cluster_num_workers"></a> [cluster\_num\_workers](#input\_cluster\_num\_workers) | n/a | `any` | n/a | yes |
| <a name="input_databricks_service_principal_display_name"></a> [databricks\_service\_principal\_display\_name](#input\_databricks\_service\_principal\_display\_name) | A workspace display name for the Azure Databricks service principal. | `string` | `"databricks_sp"` | no |
| <a name="input_databricks_storage_credential"></a> [databricks\_storage\_credential](#input\_databricks\_storage\_credential) | The storage credentials for the Databricks workspace | `string` | `"default"` | no |
| <a name="input_deploy_databricks_catalog"></a> [deploy\_databricks\_catalog](#input\_deploy\_databricks\_catalog) | Whether to include the Databricks Catalog module | `bool` | `false` | no |
| <a name="input_deploy_databricks_clusters"></a> [deploy\_databricks\_clusters](#input\_deploy\_databricks\_clusters) | Set to true to deploy Module A | `bool` | `true` | no |
| <a name="input_deploy_databricks_metastore"></a> [deploy\_databricks\_metastore](#input\_deploy\_databricks\_metastore) | Whether to include the Databricks Notebooks module | `bool` | `false` | no |
| <a name="input_deploy_databricks_repos"></a> [deploy\_databricks\_repos](#input\_deploy\_databricks\_repos) | Set to true to deploy Module A | `bool` | `true` | no |
| <a name="input_external_location"></a> [external\_location](#input\_external\_location) | The location of the external storage | `string` | n/a | yes |
| <a name="input_git_provider"></a> [git\_provider](#input\_git\_provider) | The username for the Git repository | `string` | n/a | yes |
| <a name="input_git_username"></a> [git\_username](#input\_git\_username) | The username for the Git repository | `string` | n/a | yes |
| <a name="input_include_databricks_notebooks"></a> [include\_databricks\_notebooks](#input\_include\_databricks\_notebooks) | Whether to include the Databricks Notebooks module | `bool` | `false` | no |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | Name of the Azure Key Vault | `string` | `"abdevkv"` | no |
| <a name="input_key_vault_resource_group"></a> [key\_vault\_resource\_group](#input\_key\_vault\_resource\_group) | Name of the Azure Resource Group for the Key Vault | `string` | `"ab_pbi_embedded_dev"` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region for all resources | `string` | `"West Europe"` | no |
| <a name="input_metastore_id"></a> [metastore\_id](#input\_metastore\_id) | ID of the existing Databricks metastore | `string` | n/a | yes |
| <a name="input_ml_cluster_name"></a> [ml\_cluster\_name](#input\_ml\_cluster\_name) | ## --- Clusters --- ### | `any` | n/a | yes |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | n/a | `any` | n/a | yes |
| <a name="input_personal_access_token"></a> [personal\_access\_token](#input\_personal\_access\_token) | The personal access token for the Git repository | `string` | n/a | yes |
| <a name="input_repo_path"></a> [repo\_path](#input\_repo\_path) | The path in the Databricks workspace where the repo will be cloned | `string` | n/a | yes |
| <a name="input_repo_url"></a> [repo\_url](#input\_repo\_url) | The URL of the GitHub repository | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the Azure Resource Group | `string` | `"databricks-training-rg"` | no |
| <a name="input_schema_name"></a> [schema\_name](#input\_schema\_name) | Name of the Databricks schema | `string` | `"genai"` | no |
| <a name="input_single_user_name"></a> [single\_user\_name](#input\_single\_user\_name) | Username for the single user | `any` | n/a | yes |
| <a name="input_small_cluster_name"></a> [small\_cluster\_name](#input\_small\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Azure Subscription ID | `any` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | Azure Active Directory tenant ID | `string` | n/a | yes |
| <a name="input_workspace_name"></a> [workspace\_name](#input\_workspace\_name) | Name of the Databricks Workspace | `string` | `"databricks-training-ws"` | no |
| <a name="input_workspace_sku"></a> [workspace\_sku](#input\_workspace\_sku) | SKU for the Databricks workspace | `string` | `"premium"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_workspace_url"></a> [workspace\_url](#output\_workspace\_url) | --- Outputs |
