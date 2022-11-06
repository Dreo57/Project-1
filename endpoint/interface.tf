resource "aws_vpc_endpoint" "vpcinterface" {
    service_name = "com.amazonaws.us-east-1.secretsmanager"
    vpc_id = var.vpc_id
    subnet_ids = [var.subnet_ids]
    security_group_ids = [var.sgid]
    vpc_endpoint_type = "Interface"
  
}