resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "${var.project_name}-igw"
  }
}

# Subnets creation
resource "aws_subnet" "subnets" {
  for_each = var.subnets

  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az
  tags = {
    Name = "${var.project_name}-${each.key}"
  }
}

# Public Route Table
resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "${var.project_name}-public-rtb"
  }
}

resource "aws_route" "igw_route" {
  route_table_id         = aws_route_table.public_rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Private Route Table
resource "aws_route_table" "private_rtb" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "${var.project_name}-private-rtb"
  }
}

# NAT Gateway for private subnets
resource "aws_eip" "nat_eip" {
  domain = "vpc"
  tags = {
    Name = "${var.project_name}-nat-eip"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.subnets["public-subnet-2a"].id
  tags = {
    Name = "${var.project_name}-nat-gw"
  }
}

resource "aws_route" "nat_route" {
  route_table_id         = aws_route_table.private_rtb.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw.id
}

# Subnets Association with Route Tables
resource "aws_route_table_association" "public_rta" {
  for_each    = { for key, val in var.subnets : key => val if val.route_table == "public" }
  subnet_id   = aws_subnet.subnets[each.key].id
  route_table_id = aws_route_table.public_rtb.id
}

resource "aws_route_table_association" "private_rta" {
  for_each    = { for key, val in var.subnets : key => val if val.route_table == "private" }
  subnet_id   = aws_subnet.subnets[each.key].id
  route_table_id = aws_route_table.private_rtb.id
}
