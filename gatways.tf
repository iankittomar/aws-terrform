resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.default.id}"
  tags = {
    Name = "InternetGateway"
  }
}

resource "aws_nat_gateway" "gw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.public.id}"
  depends_on    = ["aws_internet_gateway.gw"]

  tags = {
    Name = "gw NAT "
  }
}
resource "aws_eip" "nat" {
  vpc                       = true
  associate_with_private_ip = "${var.public_subnet_cidr}"
  depends_on                = ["aws_internet_gateway.gw"]
}