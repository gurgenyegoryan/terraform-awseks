resource "aws_eip" "nat1" {

  depends_on = [
    aws_internet_gateway.telecom-gateway
  ]

  tags = {
    Name = "telecom-elastic-ip1"
  }

}

resource "aws_eip" "nat2" {

  depends_on = [
    aws_internet_gateway.telecom-gateway
  ]

  tags = {
    Name = "telecom-elastic-ip2"
  }

}
