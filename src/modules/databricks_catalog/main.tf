resource "databricks_catalog" "main_catalog" {
  name    = var.catalog_name
  comment = "Main catalog for the project"
}

resource "databricks_schema" "genai_schema" {
  catalog_name = databricks_catalog.main_catalog.name
  name         = var.schema_name
  comment      = "Schema for GenAI"
  depends_on   = [databricks_catalog.main_catalog]
}