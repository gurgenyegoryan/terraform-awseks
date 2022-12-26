resource "aws_route_table" "telecom-public-route" {

  vpc_id = aws_vpc.telecom_vpc.id
  route {

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.telecom-gateway.id

  }

  tags = {
    Name = "telecom-public-route"
  }
}

resource "aws_route_table" "telecom-private1-route" {

  vpc_id = aws_vpc.telecom_vpc.id
  route {

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gateway1.id
  }

  tags = {
    Name = "telecom-private1-route"
  }
}

resource "aws_route_table" "telecom-private2-route" {

  vpc_id = aws_vpc.telecom_vpc.id
  route {

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gateway2.id
  }

  tags = {
    Name = "telecom-private2-route"
  }
}