resource "aws_route_table" "public-routing-table" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }

  tags = {
    Name        = "${var.vpc_name}-Public-RT"
    DeployedBy  = local.DeployedBy
    Costcenter  = local.Costcenter
    TeamDL      = local.TeamDL
    environment = "${var.environment}"
  }
}

resource "aws_route_table" "private-routing-table" {
  vpc_id = aws_vpc.default.id
route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.natgw_id
  }
  tags = {
    Name        = "${var.vpc_name}-Private-RT"
    DeployedBy  = local.DeployedBy
    Costcenter  = local.Costcenter
    TeamDL      = local.TeamDL
    environment = "${var.environment}"
  }
}

resource "aws_route_table_association" "public-subnets" {
  count          = length(var.public_cidr_block)
  subnet_id      = element(aws_subnet.public-subnets.*.id, count.index)
  route_table_id = aws_route_table.public-routing-table.id
}

resource "aws_route_table_association" "private-subnets" {
  count          = length(var.private_cidr_block)
  subnet_id      = element(aws_subnet.private-subnets.*.id, count.index)
  route_table_id = aws_route_table.private-routing-table.id
}