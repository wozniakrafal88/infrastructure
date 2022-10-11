resource "aws_security_group" "sc_ssh" {
  name   = "${var.tag_name_prefix}_Security_Group_SSH"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.cidr_blocks_for_bastion}"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.env_name}_${var.tag_name_prefix}_Security_Group_SSH"
    Owner = var.tag_owner
  }
}

resource "aws_security_group" "sc_apps" {
  name   = "${var.tag_name_prefix}_Security_Group_Apps"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/16"]

  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/16"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.env_name}_${var.tag_name_prefix}_Security_Group_Apps"
    Owner = var.tag_owner
  }
}

resource "aws_security_group" "sc_db" {
  name   = "${var.tag_name_prefix}_Security_Group_DB"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.env_name}_${var.tag_name_prefix}_Security_Group_DB"
    Owner = var.tag_owner
  }
}

resource "aws_security_group" "sc_lb" {
  name   = "${var.tag_name_prefix}_Security_Group_LB"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

    ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.env_name}_${var.tag_name_prefix}_Security_Group_LB"
    Owner = var.tag_owner
  }
}

resource "aws_security_group" "sc_jenkins" {
  name   = "${var.tag_name_prefix}_Security_Group_Jenkins"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]

  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["10.0.0.0/16"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "${var.env_name}_${var.tag_name_prefix}_Security_Group_Jenkins"
    Owner = var.tag_owner
  }
}