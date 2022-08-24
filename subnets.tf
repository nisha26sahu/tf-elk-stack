resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.vpc_elk.id
  cidr_block = "192.168.1.0/24"
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "kibana_public"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id     = aws_vpc.vpc_elk.id
  cidr_block = "192.168.2.0/24"
  availability_zone = "eu-west-1b"
   

  tags = {
    Name = "private_a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id     = aws_vpc.vpc_elk.id
  cidr_block = "192.168.3.0/24"
  availability_zone = "eu-west-1c"

  tags = {
    Name = "private_b"
  }
}

resource "aws_subnet" "private_c" {
  vpc_id     = aws_vpc.vpc_elk.id
  cidr_block = "192.168.4.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "private_c"
  }
}

resource "aws_subnet" "private_d" {
  vpc_id     = aws_vpc.vpc_elk.id
  cidr_block = "192.168.5.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "private_d"
  }
}