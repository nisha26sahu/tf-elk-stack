resource "aws_vpc" "vpc_elk" {
  cidr_block = "192.168.0.0/16"

  tags = {
    Name = "vpc_elk"
  }
}



resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc_elk.id

  tags = {
    Name = "internet_gateway"
  }
}

resource "aws_eip" "nat_eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "NAT_gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.internet_gateway]
}
