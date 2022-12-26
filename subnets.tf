resource "aws_subnet" "telecom_subnet_public_1" {
  vpc_id = aws_vpc.telecom_vpc.id

  cidr_block = "192.168.0.0/18"

  availability_zone = "eu-west-1a"

  map_public_ip_on_launch = true


  tags = {
    Name                                    = "telecom_subnet_public_1-eu-west-1a"
    "kubernetes.io/cluster/telecom-project" = "shared"
    "kubernetes.io/role/elb"                = 1

  }
}

resource "aws_subnet" "telecom_subnet_public_2" {
  vpc_id = aws_vpc.telecom_vpc.id

  cidr_block = "192.168.64.0/18"

  availability_zone = "eu-west-1b"

  map_public_ip_on_launch = true

  tags = {
    Name                                    = "telecom_subnet_public_2-eu-west-1b"
    "kubernetes.io/cluster/telecom-project" = "shared"
    "kubernetes.io/role/elb"                = 1
  }
}

resource "aws_subnet" "telecom_subnet_private_1" {
  vpc_id = aws_vpc.telecom_vpc.id

  cidr_block = "192.168.128.0/18"

  availability_zone = "eu-west-1a"

  map_public_ip_on_launch = false

  tags = {
    Name                                    = "telecom_subnet_private_1-eu-west-1a"
    "kubernetes.io/cluster/telecom-project" = "shared"
    "kubernetes.io/role/internal-elb"       = 1
  }
}

resource "aws_subnet" "telecom_subnet_private_2" {
  vpc_id = aws_vpc.telecom_vpc.id

  cidr_block = "192.168.192.0/18"

  availability_zone = "eu-west-1b"

  map_public_ip_on_launch = false

  tags = {
    Name                                    = "telecom_subnet_private_2-eu-west-1b"
    "kubernetes.io/cluster/telecom-project" = "shared"
    "kubernetes.io/role/internal-elb"       = 1
  }
}