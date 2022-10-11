resource "aws_route_table" "rt_pub" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name  = "${var.env_name}_${var.tag_name_prefix}_pub_RT"
    Owner = var.tag_owner
  }
}

resource "aws_route_table" "rt_priv" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name  = "${var.env_name}_${var.tag_name_prefix}_pub_RT"
    Owner = var.tag_owner
  }
}

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public_subnet[0].id
  route_table_id = aws_route_table.rt_pub.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public_subnet[1].id
  route_table_id = aws_route_table.rt_pub.id
}

resource "aws_route_table_association" "priv1" {
  subnet_id      = aws_subnet.private_subnet[0].id
  route_table_id = aws_route_table.rt_priv.id
}

resource "aws_route_table_association" "priv2" {
  subnet_id      = aws_subnet.private_subnet[1].id
  route_table_id = aws_route_table.rt_priv.id
}