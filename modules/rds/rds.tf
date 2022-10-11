resource "aws_db_instance" "rds" {
  allocated_storage                   = 10
  engine                              = var.engine
  engine_version                      = var.engine_version
  instance_class                      = var.instance_class
  identifier                          = lower(local.identifier)
  username                            = var.username
  password                            = var.password
  skip_final_snapshot                 = var.skip_final_snapshot
  db_subnet_group_name                = aws_db_subnet_group.db_subnet.id
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  vpc_security_group_ids              = ["${var.sc_db_id}"]
  tags = {
    Name  = "${var.env_name}_${var.tag_name_prefix}_db"
    Owner = var.tag_owner
  }
}

resource "aws_db_subnet_group" "db_subnet" {
  name       = "${var.env_name}_${var.tag_name_prefix}_db_subnet"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name  = "${var.env_name}_${var.tag_name_prefix}_db_subnet"
    Owner = var.tag_owner
  }

}