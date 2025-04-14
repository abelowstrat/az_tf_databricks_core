resource "databricks_notebook" "lessons" {
  count  = length(var.notebook_files)
  source = "${path.module}/notebooks/${var.notebook_files[count.index]}"
  path   = "${var.target_folder}/${basename(var.notebook_files[count.index])}"
}