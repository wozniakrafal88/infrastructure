resource "aws_lb_target_group" "tg" {
  count       = length (var.app_info)
  name        = "${var.env_name}-${var.tag_name_prefix}-tg-${var.app_info[count.index].name}"
  target_type = "ip"
  port        = var.app_info[count.index].port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  health_check{
    path        = "/${var.app_info[count.index].name}"
  }

}

resource "aws_lb_target_group" "tg-jenkins" {
  name        = "${var.env_name}-${var.tag_name_prefix}-tg-jenkins"
  target_type = "instance"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  health_check{
    path        = "/login"
    port = 8080
  }

}

resource "aws_lb_target_group_attachment" "jenkins_target" {
  target_group_arn = aws_lb_target_group.tg-jenkins.arn
  target_id        = var.ec2_jenkins_id
  port             = 8080
}