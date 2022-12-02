output "vpc_id" {
    value = aws_vpc.projvpc.id
}

output "snpub_id" {
    value = aws_subnet.projpubsubnet[0].id
}

output "snpub1_id" {
    value = aws_subnet.projpubsubnet[1].id
}

output "snprvt_id" {
    value = aws_subnet.projprvtsubnet[0].id
}
output "snprvt1_id" {
    value = aws_subnet.projprvtsubnet[1].id
}

output "route-table-id" {
    value = aws_route_table.projpubrt[0].id
}
output "route-table-id1" {
    value = aws_route_table.projpubrt[1].id
}

output "az" {
    value = aws_subnet.projpubsubnet[0].availability_zone
}
output "az1" {
    value = aws_subnet.projpubsubnet[1].availability_zone
}
output "az2" {
    value = aws_subnet.projprvtsubnet[0].availability_zone
}
output "az3" {
    value = aws_subnet.projprvtsubnet[1].availability_zone
}