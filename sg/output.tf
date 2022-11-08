output "sg_id" {
    value = aws_security_group.ec_sg.id
}

# output "rds_sg_id" {
#     value = aws_security_group.rds_sg.id
# }
output "lb-sg_id" {
    value = aws_security_group.lb_sg.id
}
# output "ec2-sg_id" {
#     value = aws_security_group.ec2_sg.id
# }

