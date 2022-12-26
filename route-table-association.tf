resource "aws_route_table_association" "telecom-public1" {

  subnet_id = aws_subnet.telecom_subnet_public_1.id

  route_table_id = aws_route_table.telecom-public-route.id

}

resource "aws_route_table_association" "telecom-public2" {

  subnet_id = aws_subnet.telecom_subnet_public_2.id

  route_table_id = aws_route_table.telecom-public-route.id

}

resource "aws_route_table_association" "telecom-private1" {

  subnet_id = aws_subnet.telecom_subnet_private_1.id

  route_table_id = aws_route_table.telecom-private1-route.id


}

resource "aws_route_table_association" "telecom-private2" {

  subnet_id = aws_subnet.telecom_subnet_private_2.id

  route_table_id = aws_route_table.telecom-private2-route.id


}