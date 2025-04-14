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
| [databricks_cluster.ML_cluster](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/cluster) | resource |
| [databricks_cluster.small_cluster](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/cluster) | resource |
| [databricks_user.single_user](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/user) | resource |
| [databricks_spark_version.latest_lts](https://registry.terraform.io/providers/databricks/databricks/latest/docs/data-sources/spark_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_autotermination_minutes"></a> [cluster\_autotermination\_minutes](#input\_cluster\_autotermination\_minutes) | n/a | `any` | n/a | yes |
| <a name="input_cluster_data_security_mode"></a> [cluster\_data\_security\_mode](#input\_cluster\_data\_security\_mode) | n/a | `any` | n/a | yes |
| <a name="input_cluster_num_workers"></a> [cluster\_num\_workers](#input\_cluster\_num\_workers) | n/a | `any` | n/a | yes |
| <a name="input_ml_cluster_name"></a> [ml\_cluster\_name](#input\_ml\_cluster\_name) | n/a | `any` | n/a | yes |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | n/a | `any` | n/a | yes |
| <a name="input_single_user_name"></a> [single\_user\_name](#input\_single\_user\_name) | Username for the single user | `any` | n/a | yes |
| <a name="input_small_cluster_name"></a> [small\_cluster\_name](#input\_small\_cluster\_name) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ml_cluster_url"></a> [ml\_cluster\_url](#output\_ml\_cluster\_url) | n/a |
| <a name="output_small_cluster_url"></a> [small\_cluster\_url](#output\_small\_cluster\_url) | n/a |
