resource "aws_nat_gateway" "gateway1" {

  allocation_id = aws_eip.nat1.id

  subnet_id = aws_subnet.telecom_subnet_public_1.id

  tags = {
    Name = "telecom-Nat1"
  }
}

resource "aws_nat_gateway" "gateway2" {

  allocation_id = aws_eip.nat2.id

  subnet_id = aws_subnet.telecom_subnet_public_2.id

  tags = {
    Name = "telecom-Nat2"
  }
}