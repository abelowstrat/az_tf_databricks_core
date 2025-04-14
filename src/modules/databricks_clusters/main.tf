resource "databricks_user" "single_user" {
  user_name = var.single_user_name
}

# Create the cluster with the "smallest" amount
# of resources allowed.
# data "databricks_node_type" "smallest" {
#   local_disk = true
#   depends_on = [databricks_token.access_token]
# }

data "databricks_spark_version" "latest_lts" {
  long_term_support = true
  ml                = true
}

# Databricks Cluster
resource "databricks_cluster" "ML_cluster" {
  cluster_name = var.ml_cluster_name
  spark_version = data.databricks_spark_version.latest_lts.id # for databricks data engineer professional, use "12.2.x-scala2.12". For genai engineering, check the recommendation
  node_type_id = var.node_type #or standard small type: "Standard_DS3_v2"
  data_security_mode      = var.cluster_data_security_mode
  single_user_name        = var.single_user_name
  autotermination_minutes = var.cluster_autotermination_minutes
  num_workers             = var.cluster_num_workers
  spark_conf = {
    # Single-node
    #"spark.databricks.cluster.profile" : "singleNode"
    #"spark.master" : "local[*]"
  }
  custom_tags = {
    #"ResourceClass" = "SingleNode"
  }
  depends_on = [databricks_user.single_user]
}

# Databricks Cluster
resource "databricks_cluster" "small_cluster" {
  cluster_name = var.small_cluster_name
  spark_version = data.databricks_spark_version.latest_lts.id # for databricks data engineer professional, use "12.2.x-scala2.12". For genai engineering, check the recommendation
  node_type_id = var.node_type #or standard small type: "Standard_DS3_v2"
  data_security_mode      = var.cluster_data_security_mode
  single_user_name        = var.single_user_name
  autotermination_minutes = var.cluster_autotermination_minutes
  num_workers             = var.cluster_num_workers
  spark_conf = {
    # Single-node
    #"spark.databricks.cluster.profile" : "singleNode"
    #"spark.master" : "local[*]"
  }
  custom_tags = {
    #"ResourceClass" = "SingleNode"
  }
  depends_on = [databricks_user.single_user]
}