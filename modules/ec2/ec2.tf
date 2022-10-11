resource "aws_instance" "ec2_bastion" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type
  associate_public_ip_address = var.ec2_associate_public_ip_address
  key_name                    = aws_key_pair.key_pair.key_name
  vpc_security_group_ids              = ["${var.sc_ssh_id}","${var.sc_apps_id}"]
  subnet_id                   = var.public_subnet_ids[1]
  tags = {
    Name  = "${var.env_name}_${var.tag_name_prefix}_bastion"
    Owner = var.tag_owner
  }
  iam_instance_profile = "${var.rds_to_ec2_iam_profile}"
  user_data_replace_on_change = "false"
  user_data = templatefile("${path.module}/bastion_create_db.tftpl", {})
  depends_on = [
    var.rds_host
  ]
}

resource "aws_instance" "ec2_jenkins" {
  ami             = var.ec2_ami
  instance_type   = var.ec2_instance_type
  key_name        = aws_key_pair.key_pair.key_name
  vpc_security_group_ids  = ["${var.sc_jenkins_id}"]
  subnet_id       = var.private_subnet_ids[0]
  tags = {
    Name  = "${var.env_name}_${var.tag_name_prefix}_jenkins"
    Owner = var.tag_owner
  }
  iam_instance_profile = "${var.s3_jenkins_to_ec2_profile}"
  user_data_replace_on_change = "false"
  user_data = templatefile("${path.module}/jenkins_user_data.tftpl", {private_key_long = tls_private_key.private_key.private_key_pem, jenkins_load_Balancer_url = var.jenkins_load_Balancer_url})
  
}