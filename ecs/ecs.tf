resource "aws_ecs_cluster" "dreo_inc_cluster" {
    name = "trial_cluster"
    setting {
      name = "containerInsights"
      value = "disabled"
    }  
}

resource "aws_ecs_task_definition" "dreo_inc_task-definition" {
  requires_compatibilities = ["FARGATE"]
  family = "trial-def"
  cpu = "1vCPU"
  memory = "2GB"
  network_mode = "awsvpc"
  execution_role_arn = data.aws_iam_role.dreo_inc_exec-role.arn
  container_definitions = jsonencode([{
      name      = "dreo-container"
      image     = "nginx"
      essential = true
      portMappings = [
        {
          containerPort = 80
        }
      ]
  },
  ])

}

data "aws_iam_role" "dreo_inc_exec-role" {
  name = "ecsTaskExecutionRole"
}
