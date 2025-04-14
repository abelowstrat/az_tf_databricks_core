variable "ml_cluster_name" {}
variable "small_cluster_name" {}
variable "cluster_autotermination_minutes" {}
variable "cluster_num_workers" {}
variable "node_type" {}
variable "cluster_data_security_mode" {}
variable "single_user_name" {
  description = "Username for the single user"
}