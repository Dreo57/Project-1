resource "aws_security_group" "ec2_sg" {
  name        = var.sg_name
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc
  dynamic "ingress" {
    for_each = [80, 22]
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = var.cidr_blocks_id
    }
  }
}

resource "aws_security_group" "rds_sg" {
  name        = var.sg_name1
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc
  ingress {
    description      = "TLS from VPC"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = [aws_security_group.ec2_sg.id]
    ipv6_cidr_blocks = ["::/0"]

  }

}