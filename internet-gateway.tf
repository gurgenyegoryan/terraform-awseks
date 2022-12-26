resource "aws_internet_gateway" "telecom-gateway" {
  vpc_id = aws_vpc.telecom_vpc.id

  tags = {
    Name = "telecom-gateway"
  }
}