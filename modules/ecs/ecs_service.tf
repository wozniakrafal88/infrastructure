resource "aws_ecs_service" "ecs_service" {
  count       = length (var.app_info)
  name            = "${var.env_name}_${var.tag_name_prefix}_${var.app_info[count.index].name}_service"
  cluster         = aws_ecs_cluster.cluster_ecs.id
  task_definition = "${var.app_info[count.index].task_definition_arn}"
  desired_count   = 1
  launch_type = "FARGATE"
  force_new_deployment = true

  load_balancer {
    target_group_arn = "${aws_lb_target_group.tg[count.index].arn}"
    container_name   = "${var.env_name}_${var.tag_name_prefix}_${var.app_info[count.index].name}_container"
    container_port   = "${var.app_info[count.index].port}"
  }

  network_configuration {
    subnets = [ var.private_subnet_ids[count.index ] ]
    security_groups = [ "${var.sc_apps_id}" ]
  }

  service_registries {
    registry_arn = var.app_info[count.index].sd_service_arn
  }
}