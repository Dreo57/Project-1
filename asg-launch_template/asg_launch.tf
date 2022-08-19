resource "aws_autoscaling_group" "dreo" {
  name_prefix = "dreo_asg"
  depends_on = [aws_launch_template.dre_temp]
  launch_template  {
    id = aws_launch_template.dre_temp.id
    version = "$Latest"
  }
  vpc_zone_identifier = [var.snpub, var.snpub1]
  target_group_arns = [var.target-group]
  health_check_type = "ELB"
  health_check_grace_period = 300
  desired_capacity= 2
  max_size = 3
  min_size = 2
}

resource "aws_launch_template" "dre_temp" {
  name = "dreo-template"
  description = "launch template for ASG"
  image_id = data.aws_ami.app_ami.id
  instance_type= var.instance_type
  key_name=var.key_pair
  vpc_security_group_ids =  [var.sg_id]
  tags = {
    Name = "dreo-server"
  }

#   user_data = <<EOF
# #!/bin/bash
# sudo yum update -y
# sudo amazon-linux-extras install nginx1 -y
# sudo systemctl enable nginx
# sudo systemctl start nginx
# EOF

}

data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

# resource "aws_autoscaling_attachment" "dreo-tg-att" {
#   autoscaling_group_name = aws_autoscaling_group.dreo.name
#   elb = var.alb-id
# }
