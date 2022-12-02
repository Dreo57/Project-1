resource "aws_vpc" "projvpc" {
  cidr_block = data.aws_ssm_parameter.vpc_cidr.value
  enable_dns_support= true
  enable_dns_hostnames= true
  tags = {
    Name= "drenet"
  }
}

data "aws_ssm_parameter" "vpc_cidr" {
  name = "/Dreo/cidr"
}

resource "aws_subnet" "projpubsubnet" {
  count = length(var.cidr_block_pub)
  cidr_block = var.cidr_block_pub[count.index]
  vpc_id = aws_vpc.projvpc.id
  availability_zone = var.availability_zone_pub[count.index]
  map_public_ip_on_launch= true
  tags = {
    Name= var.sn_name_tag_pub[count.index]
  }
}

resource "aws_subnet" "projprvtsubnet" {
  count = length(var.cidr_block_prvt)
  cidr_block = var.cidr_block_prvt[count.index]
  vpc_id = aws_vpc.projvpc.id
  availability_zone = var.availability_zone_prvt[count.index]
  map_public_ip_on_launch= false
  tags = {
    Name= var.sn_name_tag_prvt[count.index]
  }
}


resource "aws_internet_gateway" "projgw" {
  vpc_id = aws_vpc.projvpc.id
  tags = {
    Name= "drenetgw"
  }
}

resource "aws_route_table" "projpubrt" {
  count = length(var.route-table-tag)
    vpc_id = aws_vpc.projvpc.id
  tags = {
    Name= var.route-table-tag[count.index]
  }
}

resource "aws_route_table_association" "pubrtass" {
  route_table_id = aws_route_table.projpubrt[0].id
  subnet_id = aws_subnet.projpubsubnet[0].id
}

resource "aws_route_table_association" "pubrtass1" {
  route_table_id = aws_route_table.projpubrt[0].id
  subnet_id = aws_subnet.projpubsubnet[1].id
}

resource "aws_route_table_association" "prvtrtass" {
  route_table_id = aws_route_table.projpubrt[1].id
  subnet_id = aws_subnet.projprvtsubnet[0].id
}

resource "aws_route_table_association" "prvtrtass1" {
  route_table_id = aws_route_table.projpubrt[2].id
  subnet_id = aws_subnet.projprvtsubnet[1].id
}

resource "aws_route" "projroute_igw" {
  route_table_id = aws_route_table.projpubrt[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.projgw.id
}

resource "aws_eip" "projeip" {
  count = 2
  vpc = true  
}

resource "aws_nat_gateway" "projnat" {
  subnet_id = aws_subnet.projpubsubnet[0].id
  connectivity_type = "public"
  allocation_id = aws_eip.projeip[0].allocation_id
}

resource "aws_nat_gateway" "projnat1" {
  subnet_id = aws_subnet.projpubsubnet[1].id
  connectivity_type = "public"
  allocation_id = aws_eip.projeip[1].allocation_id
}

resource "aws_route" "projroute_ngw" {
  route_table_id = aws_route_table.projpubrt[1].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.projnat.id
}

resource "aws_route" "projroute_ngw1" {
  route_table_id = aws_route_table.projpubrt[2].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.projnat1.id
}

