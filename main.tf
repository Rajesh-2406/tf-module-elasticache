resource "aws_elasticache_subnet_group" "main" {
  name = "${var.component}-${var.env}"
  subnet_ids = var.subnet_ids
  tags   = merge({Name = "${var.component}-${var.env}"}, var.tags)
}
resource "aws_security_group" "sg" {
  name        = "${var.component}-${var.env}-sg"
  description = "${var.component}-${var.env}-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = var.sg_subnet_cidr
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    name = "${var.component}-${var.env}-sg"
  }
}
resource "aws-ealsticache_replication_group" "main" {
  replication_group_id = "${var.component}-${var.env}"
  description = "${var.component}-${var.env}"
  node_type = var.node_type
  port = var.port
  automatic_failover_enabled = true
  num_node_groups = var.num_node_groups
  replicas_per_node_group = var.replicas_per_node_group
  subnet_group_name = aws_security_group.name
  parameter_group_name = "default.redis6.x.cluster.on"
  security_group_ids = [ aws_security_group.main.id]
  kms_key_id = var.kms_key_arn

 }