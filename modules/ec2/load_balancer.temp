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
/*
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_db.arn
  }
}

resource "aws_lb_listener_rule" "rds_rule_1" {
  listener_arn = aws_lb_listener.alb_listener.arn
  priority     = 10

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_db.arn
  }
  condition {
    path_pattern {
      values = ["/db"]
    }
  }
}

resource "aws_lb_listener_rule" "rds_rule_2" {
  listener_arn = aws_lb_listener.alb_listener.arn
  priority     = 11

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_db.arn
  }

  condition {
    path_pattern {
      values = ["/db/*"]
    }
  }
}

resource "aws_lb_listener_rule" "s3_rule_1" {
  listener_arn = aws_lb_listener.alb_listener.arn
  priority     = 20

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_s3.arn
  }

  condition {
    path_pattern {
      values = ["/s3/*"]
    }
  }
}

resource "aws_lb_listener_rule" "s3_rule_2" {
  listener_arn = aws_lb_listener.alb_listener.arn
  priority     = 21

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_s3.arn
  }
  condition {
    path_pattern {
      values = ["/s3"]
    }
  }
}*/