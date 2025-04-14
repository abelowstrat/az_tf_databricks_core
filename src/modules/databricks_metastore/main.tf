### --- Metastore --- ###
# Assign the existing Metastore to the Workspace
resource "databricks_metastore_assignment" "metastore_assignment" {
  workspace_id = var.workspace_id
  metastore_id = var.metastore_id
}

resource "databricks_external_location" "some" {
  name            = "external"
  url             = var.external_location
  credential_name = databricks_storage_credential.external.id
  comment         = "Managed by TF"
}

resource "databricks_storage_credential" "external" {
  name = var.databricks_storage_credential
  azure_managed_identity {
    access_connector_id = var.access_connector_id
  }
  comment = "Managed identity credential managed by TF"
}


resource "databricks_grants" "external_creds" {
  storage_credential = databricks_storage_credential.external.id
  grant {
    principal  = "All account users"
    privileges = ["CREATE TABLE", "READ FILES", "WRITE FILES"]
  }
}