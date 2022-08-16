resource "aws_instance" "webserver" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.aws_instance
  associate_public_ip_address   = true
  subnet_id = var.sn_pub
  vpc_security_group_ids =  [var.sg_id]
  key_name = var.key_pair
  
  root_block_device {
    volume_size = 8
    volume_type = "gp2"
    }

  tags = {
    Name = "netflix-webserver"
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
