resource "aws_autoscaling_group" "dreo" {
  name_prefix = "dreo_asg"
  depends_on = [aws_launch_template.dre_temp]
  launch_template  {
    id = aws_launch_template.dre_temp.id
    version = "$Latest"
  }
  vpc_zone_identifier = [var.snprvt, var.snprvt1]
  target_group_arns = [var.target-group]
  health_check_type = "EC2"
  health_check_grace_period = 300
  desired_capacity= 2
  max_size = 3
  min_size = 2
}

data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

data "aws_ssm_parameter" "key_parameter" {
  name = var.key_name
}

data "aws_ssm_parameter" "instance_parameter" {
  name = var.instance_id
}

data "aws_iam_role" "dreo_role" {
  name = "AWS-SSMFull"  
}

resource "aws_iam_instance_profile" "dreo_profile" {
  name = "dreo_inst_profile"  
  role = data.aws_iam_role.dreo_role.id
}

resource "aws_launch_template" "dre_temp" {
  name = "dreo-template"
  description = "launch template for ASG"
  image_id = data.aws_ami.app_ami.id
  instance_type= data.aws_ssm_parameter.instance_parameter.value
  key_name= data.aws_ssm_parameter.key_parameter.value
  vpc_security_group_ids =  [var.ec2-sg_id]
  iam_instance_profile {
    name = aws_iam_instance_profile.dreo_profile.id
  }
  tags = {
    Name = "dreo-server"
  }

  user_data = "${base64encode(file("script.sh"))}"

}
