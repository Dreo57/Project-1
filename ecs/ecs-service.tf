resource "aws_ecs_service" "dreo_inc_service" {
    name = "trial_service"
    cluster = aws_ecs_cluster.dreo_inc_cluster.id
    launch_type = "FARGATE"
    task_definition = aws_ecs_task_definition.dreo_inc_task-definition.id
    scheduling_strategy = "REPLICA"
    desired_count = 2
    deployment_minimum_healthy_percent = 0
    deployment_maximum_percent = 200
    deployment_circuit_breaker {
        enable = false
        rollback = false
    } 
    network_configuration {
        subnets = [var.sub_id, var.sub_id1]
        security_groups = [var.sec_grp]
        assign_public_ip = true

    }
    load_balancer {
      target_group_arn = var.target_group
      container_name = "dreo-container"
      container_port = 80
    }
  
}