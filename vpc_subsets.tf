resource "aws_vpc" "default" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "terraform-aws-vpc"
  }
}

/*
  Public Subnet
*/
resource "aws_subnet" "public" {
  vpc_id                  = "${aws_vpc.default.id}"
  map_public_ip_on_launch = true
  cidr_block              = "${var.public_subnet_cidr}"
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.default.id}"
  tags = {
    Name = "Public route table"
  }
}


resource "aws_route" "public" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.gw.id}"
}



resource "aws_route_table_association" "public" {
  subnet_id      = "${aws_subnet.public.id}"
  route_table_id = "${aws_route_table.public.id}"
}

/*
  Private Subnet
*/
resource "aws_subnet" "private" {
  vpc_id = "${aws_vpc.default.id}"

  cidr_block        = "${var.private_subnet_cidr}"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "Private Subnet"
  }
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.default.id}"
  tags = {
    Name = "Private route table"
  }
}

resource "aws_route" "private" {
  route_table_id         = "${aws_route_table.private.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.gw.id}"
  depends_on             = ["aws_nat_gateway.gw"]
}


resource "aws_route_table_association" "private" {
  subnet_id      = "${aws_subnet.private.id}"
  route_table_id = "${aws_route_table.private.id}"
}
