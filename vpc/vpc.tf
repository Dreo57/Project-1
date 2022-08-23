resource "aws_vpc" "projvpc" {
  cidr_block = "190.0.0.0/16"
  enable_dns_support= true
  enable_dns_hostnames= true
  tags = {
    Name= "drenet"
  }
}

resource "aws_subnet" "projsubnet" {
  count = length(var.cidr_block)
  cidr_block = var.cidr_block[count.index]
  vpc_id = aws_vpc.projvpc.id
  availability_zone = var.availability_zone[count.index]
  map_public_ip_on_launch= true
  tags = {
    Name= var.sn_name_tag[count.index]
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
  subnet_id = aws_subnet.projsubnet[0].id
}

resource "aws_route_table_association" "pubrtass1" {
  route_table_id = aws_route_table.projpubrt[0].id
  subnet_id = aws_subnet.projsubnet[2].id
}

resource "aws_route_table_association" "prvtrtass" {
  route_table_id = aws_route_table.projpubrt[1].id
  subnet_id = aws_subnet.projsubnet[1].id
}

resource "aws_route_table_association" "prvtrtass1" {
  route_table_id = aws_route_table.projpubrt[1].id
  subnet_id = aws_subnet.projsubnet[3].id
}

resource "aws_route" "projroute" {
  route_table_id = aws_route_table.projpubrt[0].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.projgw.id
}