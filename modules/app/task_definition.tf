resource "aws_ecs_task_definition" "task_definition" {
  family = "${var.env_name}_${var.tag_name_prefix}_${var.app_name}_task_definition"
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu       = 256
  memory    = 512
  task_role_arn = var.iam_role_arn
  execution_role_arn = var.iam_role_arn
  container_definitions = jsonencode([
    {
      name      = "${var.env_name}_${var.tag_name_prefix}_${var.app_name}_container"
      image     = "${var.image_name}"
      operating_system_family = "Linux"
      cpu = 256
      memory = 512
      essential = true
      iam = var.iam_profile
      portMappings = [
        {
          containerPort = 5000
          hostPort      = 5000
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        secretOptions = null
        options = {
          awslogs-group = "/ecs/${var.env_name}_${var.tag_name_prefix}_${var.app_name}_task_definition"
          awslogs-region = "eu-west-1"
          awslogs-create-group = "true"
          awslogs-stream-prefix ="ecs"
        }
      }
    }
  ])
}