resource "aws_security_group" "ec_sg" {
  name        = var.sg_name
  description = "Allow HTTP inbound traffic"
  vpc_id      = var.vpc
  dynamic "ingress" {
    for_each = [80, 22,]
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = var.cidr_blocks_id
      ipv6_cidr_blocks = ["::/0"]
    }
  }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks = var.cidr_blocks_id
    ipv6_cidr_blocks = ["::/0"]
  }

}

# resource "aws_security_group" "rds_sg" {
#   name        = var.sg_name1
#   description = "Allow TLS inbound traffic"
#   vpc_id      = var.vpc
#   ingress {
#     description      = "TLS from VPC"
#     from_port        = 3306
#     to_port          = 3306
#     protocol         = "tcp"
#     security_groups  = [aws_security_group.ec2_sg.id]
#     ipv6_cidr_blocks = ["::/0"]
#   }
#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks = var.cidr_blocks_id
#     ipv6_cidr_blocks = ["::/0"]
#   }
# }

# resource "aws_security_group" "lb_sg" {
#   name        = var.sg_name3
#   description = "Allow HTTP inbound traffic"
#   vpc_id      = var.vpc
#   ingress {
#     description      = "HTTP from user"
#     from_port        = 80
#     to_port          = 80
#     protocol         = "tcp"
#     cidr_blocks = var.cidr_blocks_id
#   }
#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks = var.cidr_blocks_id
#   }
# }

# resource "aws_security_group" "ec2_sg" {
#   name        = var.sg_name2
#   description = "Allow SSH inbound traffic"
#   vpc_id      = var.vpc
#   ingress {
#       from_port   = 22
#       to_port     = 22
#       protocol    = "tcp"
#       cidr_blocks = ["70.74.193.61/32"]
#     }
#   ingress {
#       from_port   = 80
#       to_port     = 80
#       protocol    = "tcp"
#       security_groups  = [aws_security_group.lb_sg.id]
#     }
#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks = var.cidr_blocks_id
#   }

# }