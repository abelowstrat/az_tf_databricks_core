output "ml_cluster_url" {
  value = databricks_cluster.ML_cluster.url
}

output "small_cluster_url" {
  value = databricks_cluster.small_cluster.url
}