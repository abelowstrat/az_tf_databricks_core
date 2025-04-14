output "notebook_paths" {
  value = [for n in databricks_notebook.lessons : n.path]
}