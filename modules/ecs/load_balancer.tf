resource "aws_lb" "load_balancer" {
  name               = "${var.env_name}-${var.tag_name_prefix}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sc_lb_id]
  subnets            = var.public_subnet_ids

  tags = {
    Name  = "${var.env_name}_${var.tag_name_prefix}_alb"
    Owner = var.tag_owner
  }
}

resource "aws_lb" "jenkins_load_balancer" {
  name               = "${var.env_name}-${var.tag_name_prefix}-alb-jenkins"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sc_lb_id]
  subnets            = var.public_subnet_ids

  tags = {
    Name  = "${var.env_name}_${var.tag_name_prefix}_alb_jenkins"
    Owner = var.tag_owner
  }
}