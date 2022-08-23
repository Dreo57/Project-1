output "vpc_id" {
    value = aws_vpc.projvpc.id
}

output "snpub_id" {
    value = aws_subnet.projsubnet[0].id
}
output "snprvt_id" {
    value = aws_subnet.projsubnet[1].id
}
output "snpub1_id" {
    value = aws_subnet.projsubnet[2].id
}
output "snprvt1_id" {
    value = aws_subnet.projsubnet[3].id
}

output "route-table-id" {
    value = aws_route_table.projpubrt[0].id
}
output "route-table-id1" {
    value = aws_route_table.projpubrt[1].id
}

output "az" {
    value = aws_subnet.projsubnet[0].availability_zone
}
output "az1" {
    value = aws_subnet.projsubnet[1].availability_zone
}
output "az2" {
    value = aws_subnet.projsubnet[2].availability_zone
}
output "az3" {
    value = aws_subnet.projsubnet[3].availability_zone
}