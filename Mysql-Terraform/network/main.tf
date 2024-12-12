# VPC
resource "aws_vpc" "mysql_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  instance_tenancy = var.vpc_tenancy
  tags = {
    Name = var.vpc_name
  }
}

# Subnets
resource "aws_subnet" "public" {
  count = length(var.pub_sub_names)
  vpc_id = aws_vpc.mysql_vpc.id
  cidr_block = var.pub_cidr[count.index]
  availability_zone = "${var.aws_region}${element(["a", "b"], count.index % 2)}"
  tags = {
    Name = var.pub_sub_names[count.index]
  }
}

resource "aws_subnet" "private" {
  count = length(var.pvt_sub_names)
  vpc_id = aws_vpc.mysql_vpc.id
  cidr_block = var.pvt_cidr[count.index]
  availability_zone = "${var.aws_region}${element(["a", "b"], count.index % 2)}"
  tags = {
    Name = var.pvt_sub_names[count.index]
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.mysql_vpc.id
  tags = {
    Name = var.igw_name
  }
}

# NAT Gateway
resource "aws_eip" "nat_eip" {
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "nat_gtw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public[0].id
  tags ={
    Name = var.nat_name
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

# Route Tables
resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.mysql_vpc.id
  route {
    cidr_block = var.default_route_cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }
  route {
    cidr_block = var.vpc_cidr
    gateway_id = var.local_gateway_id
  }
  route {
    cidr_block = var.vpc_peering_cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
  }
  tags = {
    Name = var.pub_rt_names
  }
  depends_on = [ aws_vpc_peering_connection.vpc_peering ]
}

resource "aws_route_table" "pvt_rt" {
  vpc_id = aws_vpc.mysql_vpc.id
  route {
    cidr_block = var.default_route_cidr_block
    nat_gateway_id = aws_nat_gateway.nat_gtw.id
  }
  route {
    cidr_block = var.vpc_cidr
    gateway_id = var.local_gateway_id
  }
  route {
    cidr_block = var.vpc_peering_cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
  }
  tags = {
    Name = var.pvt_rt_names
  }
  depends_on = [ aws_vpc_peering_connection.vpc_peering ]
}

#aws_route_table_association
resource "aws_route_table_association" "public" {
  count = length(var.pub_sub_names)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.pub_rt.id
}
resource "aws_route_table_association" "private" {
  count = length(var.pvt_sub_names)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.pvt_rt.id
}

#VPC Peering 

resource "aws_vpc_peering_connection" "vpc_peering" {
  vpc_id          = var.peering_vpc_id
  peer_vpc_id     = aws_vpc.mysql_vpc.id
  auto_accept     = var.auto_accept_peering

  tags = {
    Name = var.vpc_peering_name
  }
}

resource "aws_route" "Existing_route" {
  route_table_id            = var.route_table_id
  destination_cidr_block    = var.vpc_cidr 
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
  depends_on = [ aws_vpc_peering_connection.vpc_peering ]
}


