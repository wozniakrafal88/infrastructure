resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name  = "${var.env_name}_${var.tag_name_prefix}_igw"
    Owner = var.tag_owner
  }
}
