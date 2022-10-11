resource "aws_subnet" "public_subnet" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnets[count.index].cidr_block
  availability_zone = var.public_subnets[count.index].availability_zone

  tags = {
    Name  = "${var.env_name}_${var.tag_name_prefix}_pub_subnet${count.index}"
    Owner = var.tag_owner
  }
}

resource "aws_subnet" "private_subnet" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnets[count.index].cidr_block
  availability_zone = var.private_subnets[count.index].availability_zone

  tags = {
    Name  = "${var.env_name}_${var.tag_name_prefix}_priv_subnet${count.index}"
    Owner = var.tag_owner
  }
}



/*resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name  = "${var.env_name}_${var.tag_name_prefix}-pub-subnet1"
    Owner = var.tag_owner
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    Name  = "${var.env_name}_${var.tag_name_prefix}-pub-subnet2"
    Owner = var.tag_owner
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name  = "${var.env_name}_${var.tag_name_prefix}-priv-subnet1"
    Owner = var.tag_owner
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-west-1b"

  tags = {
    Name  = "${var.env_name}_${var.tag_name_prefix}-priv-subnet2"
    Owner = var.tag_owner
  }
}*/