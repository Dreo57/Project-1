resource "aws_instance" "webserver" {
  ami           = data.aws_ami.app_ami.id
  instance_type = data.aws_ssm_parameter.instance_parameter.value
  associate_public_ip_address   = true
  subnet_id = var.sn_pub
  vpc_security_group_ids =  [var.sg_id]
  key_name = data.aws_ssm_parameter.key_parameter.value
  
  root_block_device {
    volume_size = 8
    volume_type = "gp2"
    }

  tags = {
    Name = "netflix-dreo"
  }

  user_data = "${base64encode(file("script.sh"))}"
}

data "aws_ssm_parameter" "key_parameter" {
  name = "/Dreo/key"
}

data "aws_ssm_parameter" "instance_parameter" {
  name = "/jjtech/ec2/instancetype"
}

data "aws_ami" "app_ami" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
