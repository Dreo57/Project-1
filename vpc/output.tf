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

output "az_id" {
    value = aws_subnet.projsnpub.availability_zone
}