resource "aws_eip" "natgw-eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.natgw-eip.id
  subnet_id     = var.public_subnet_id

  tags = {
    Name = "${var.vpc_name}-NAT-GW"
  }
}
