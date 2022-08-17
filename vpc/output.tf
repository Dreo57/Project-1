output "vpc_id" {
    value = aws_vpc.projvpc.id
}

output "sn_id" {
    value = aws_subnet.projsnprvt.id
}

output "sn1_id" {
    value = aws_subnet.projsnprvt1.id
}

output "snpub_id" {
    value = aws_subnet.projsnpub.id
}

output "snpub1_id" {
    value = aws_subnet.projsnpub1.id
}

output "az" {
    value = aws_subnet.projsnpub.availability_zone
}
output "az1" {
    value = aws_subnet.projsnprvt.availability_zone
}
output "az2" {
    value = aws_subnet.projsnpub1.availability_zone
}
output "az3" {
    value = aws_subnet.projsnprvt1.availability_zone
}