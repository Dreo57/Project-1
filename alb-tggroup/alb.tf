resource "aws_lb" "dre_alb" {
    name = "dreo-alb"
    internal = false
    load_balancer_type = "application"  
    security_groups    = [var.sg_id]
    subnets            = [var.snpub, var.snpub1]  
}

resource "aws_lb_listener" "front-end" {
  load_balancer_arn = aws_lb.dre_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.dre-tg.arn
  }
}

resource "aws_lb_target_group" "dre-tg" {
    name = "dreo-target-group"
    target_type = "instance"
    protocol = "HTTP"
    port = 80
    vpc_id = var.vpc
    health_check {
      protocol = "HTTP"
      path = "/index.html"
    }
  
}

# resource "aws_lb_target_group_attachment" "dre-tg-att" {
#     target_group_arn = aws_lb_target_group.dre-tg.arn
#     target_id = var.dre_temp
  
# }

