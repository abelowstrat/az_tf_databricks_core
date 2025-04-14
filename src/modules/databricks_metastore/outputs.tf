output "metastore_assignment_id" {
  description = "ID of the metastore assignment"
  value       = databricks_metastore_assignment.metastore_assignment.id
}

output "storage_credential_id" {
  description = "ID of the storage credential"
  value       = databricks_storage_credential.external.id
}

output "external_location_id" {
  description = "ID of the external location"
  value       = databricks_external_location.some.id
}