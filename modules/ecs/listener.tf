resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg[0].arn
  }
}

resource "aws_lb_listener" "alb__jenkins_listener" {
  load_balancer_arn = aws_lb.jenkins_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-jenkins.arn
  }
}

resource "aws_lb_listener_rule" "rule_1" {
  count       = length (var.app_info)
  listener_arn = aws_lb_listener.alb_listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg[count.index].arn
  }
  condition {
    path_pattern {
      values = ["/${var.app_info[count.index].name}"]
    }
  }
}

resource "aws_lb_listener_rule" "rule_2" {
  count       = length (var.app_info)
  listener_arn = aws_lb_listener.alb_listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg[count.index].arn
  }

  condition {
    path_pattern {
      values = ["/${var.app_info[count.index].name}/*"]
    }
  }
}