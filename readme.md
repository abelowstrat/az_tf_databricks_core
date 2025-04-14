# Databricks Workspace Deployment with Terraform

This project sets up an Azure Databricks environment, connects it to a repo with course materials for various Databricks certifications and two clusters that can be used for certification training and ML.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- Azure account with appropriate permissions
- Databricks account
- Service principal for automation
- The code assumes you have been authorized with az login on your local machine and have Contributor rights to your subscription. See [here](https://registry.terraform.io/providers/databricks/databricks/latest/docs/guides/azure-workspace) for more information.
- If you're unfamiliar with Terraform, go through the (Terraform on Azure) quickstart tutorial here: [link](https://developer.hashicorp.com/terraform/tutorials/azure-get-started)

## Files

- **main.tf**: Defines the Terraform configuration for the Azure Resource Group, Databricks Workspace, and includes module calls.
- **variables.tf**: Contains the variable definitions used in the Terraform configuration.
- **terraform.auto.tfvars**: Contains sensitive variables like service principal credentials.
- **cluster.auto.tfvars**: Additional parameters for the cluster.
- **deployment.tf**: Additional deployment configurations.
- **generate-docs.ps1**: Script to generate documentation.
- **modules/**: Contains the Terraform modules for various Databricks resources.
  - **databricks_catalog/**: Module for Databricks Catalog and Schema.
    - **main.tf**: Defines the resources for the Databricks Catalog and Schema.
    - **variables.tf**: Contains the variable definitions used in the module.
    - **README.md**: Documentation for the module.
    - **versions.tf**: Specifies the required provider versions.
  - **databricks_clusters/**: Module for Databricks Clusters.
    - **main.tf**: Defines the resources for the Databricks Clusters.
    - **variables.tf**: Contains the variable definitions used in the module.
    - **outputs.tf**: Outputs from the module.
    - **README.md**: Documentation for the module.
  - **databricks_metastore/**: Module for Databricks Metastore configurations.
  - **databricks_notebooks/**: Module for uploading Databricks Notebooks.
  - **databricks_repos/**: Module for managing Databricks Repos.

## Resources - as of 31.01.2025

### Root Module
- **azurerm_resource_group**: Creates an Azure Resource Group.
- **azurerm_databricks_workspace**: Creates an Azure Databricks Workspace.
- **databricks_token**: Creates an access token for Databricks.
- **databricks_directory**: Creates a directory in the Databricks workspace.
- **data.azurerm_key_vault**: Retrieves the Azure Key Vault.
- **data.azurerm_key_vault_secret**: Retrieves secrets from the Azure Key Vault, using your service principal (ensure the sp is configured for terraform and authorized on the kv).

### databricks_catalog Module
- **databricks_catalog**: Creates a Databricks Catalog.
- **databricks_schema**: Creates a Databricks Schema.

### databricks_clusters Module
- **databricks_cluster**: Creates Databricks Clusters (ML_cluster and small_cluster).
- **databricks_user**: Creates a Databricks user.
- **data.databricks_spark_version**: Retrieves the latest Databricks Spark version.

### databricks_metastore Module
- **databricks_metastore_assignment**: Assigns a metastore to the Databricks workspace.
- **databricks_storage_credential**: Creates storage credentials for Databricks.
- **databricks_external_location**: Creates an external location in Databricks.
- **databricks_grants**: Grants permissions for the storage credentials.

### databricks_notebooks Module
- **databricks_notebook**: Uploads Databricks Notebooks to the workspace.

### databricks_repos Module
- **databricks_git_credential**: Creates Git credentials for Databricks.
- **databricks_repo**: Manages Databricks Repos.

## Setup

1. **Clone the Repository**:
    ```sh
    git clone <repository-url>
    cd terraform-databricks-trial
    ```

2. **Configure Variables**:
    - Create the following `*.auto.tfvars` files in the `src` directory of your project. Terraform will parse these variables to set up the project:

        **`terraform.auto.tfvars`**:
        ```hcl
        azure_tenant_id = "<your-tenant-id>"
        single_user_name = "<your-single-user-name>"
        subscription_id = "<your-subscription-id>"
        metastore_id = "<your-metastore-id>"
        key_vault_name = "<your-key-vault-name>"
        key_vault_resource_group = "<your-key-vault-resource-group>"
        external_location = "<your-external-location>"
        ```

        **`repos.auto.tfvars`**:
        ```hcl
        git_username = "<your-git-username>"
        personal_access_token = "<your-personal-access-token>"
        repo_url = "<your-repo-url>"
        repo_path = "<your-repo-path>"
        ```

        **`cluster.auto.tfvars`**:
        ```hcl
        ml_cluster_name = "<your-ml-cluster-name>"
        small_cluster_name = "<your-small-cluster-name>"
        cluster_autotermination_minutes = <your-autotermination-minutes>
        cluster_num_workers = <your-num-workers>
        cluster_data_security_mode = "<your-data-security-mode>"
        node_type = "<your-node-type>"
        ```

    - Alternatively, you can set these variables using environment variables. Please make sure that you have no conflicting variables set in your environment, as these always take precedence over the `.tfvars` files.

3. **Login to Azure and Select your Subscription**:
    ```sh
    az login
    ```
    When you're working in multiple tenants, you can specify the correct one:
    ```sh
    az login --tenant <tenant_id>
    ```

4. **Initialize Terraform**:
    ```sh
    terraform init
    ```

5. **Plan the Infrastructure**:
    ```sh
    terraform plan
    ```

6. **Apply the Configuration**:
    ```sh
    terraform apply
    ```

- Use  ```terraform --help``` to see additional commands

## Selective Resource Deployment

This project allows you to selectively deploy specific resources or modules based on your requirements. You can control the deployment of each module by setting the corresponding variables in the `deployment.tf` file.

### Deployment Variables

The following variables are defined in the `deployment.tf` file to control the deployment of each module:

- `deploy_databricks_repos`: Set to `true` to deploy the Databricks Repos module, `false` to skip it.
- `deploy_databricks_clusters`: Set to `true` to deploy the Databricks Clusters module, `false` to skip it.
- `deploy_databricks_metastore`: Set to `true` to deploy the Databricks Metastore module, `false` to skip it.
- `deploy_databricks_catalog`: Set to `true` to deploy the Databricks Catalog module, `false` to skip it.
- `include_databricks_notebooks`: Set to `true` to include the Databricks Notebooks module, `false` to skip it.
