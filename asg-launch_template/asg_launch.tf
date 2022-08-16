resource "aws_autoscaling_group" "dreo" {
  name_prefix = "dreo_asg"
  launch_template  {
    id = aws_launch_template.dre_temp.id
    version = "$Latest"
  }
  vpc_zone_identifier = [var.sn, var.sn1, var.snpub, var.snpub1]
  #target_group_arns =
  health_check_type = "EC2"
  health_check_grace_period = 300
  desired_capacity= 1
  max_size = 2
  min_size = 1
}

resource "aws_launch_template" "dre_temp" {
  name = "dreo-temp"
  description = "launch template for ASG"
  image_id = data.aws_ami.app_ami.id
  instance_type= var.instance_type
  key_name=var.key_pair
  vpc_security_group_ids =  [var.sg_id]

  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
    volume_size = 8
    volume_type = "gp2"
    }
   }

}

data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
