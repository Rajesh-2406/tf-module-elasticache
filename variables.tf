variable "env" {}
variable "tags" {}
variable "component" {}
variable "subnet_ids" {}
variable "kms_key_arn" {}
variable "sg_subnet_cidr" {}
variable "engine" {}
variable "engine_version" {}
variable "node_type" {}
variable "port" {
  default = 6379
}
variable "vpc_id" {}
variable "num_node_groups" {}
variable "replicas_per_node_group" {}
variable "parameter_group_name" {}