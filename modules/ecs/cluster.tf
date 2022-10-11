resource "aws_ecs_cluster" "cluster_ecs" {
  name = "${var.env_name}_${var.tag_name_prefix}_ecs_cluster"

  tags = {
    Owner = var.tag_owner
    Name  = "${var.env_name}_${var.tag_name_prefix}_ecs_cluster"
  }
}