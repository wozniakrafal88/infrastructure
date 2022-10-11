variable "vpc_id" {
  type = string
}

variable "sc_lb_id" {
  type = string
}


variable "public_subnet_ids" {
  type = list
}

variable "sc_ssh_id" {
  type = string
}

variable "sc_apps_id" {
  type = string
}

variable "sc_jenkins_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list
}

variable "rds_iam_profile" {
  type = string
}

variable "s3_iam_profile" {
  type = string
}

variable "ec2_ami" {
  type = string
  default = "ami-0d71ea30463e0ff8d"
}

variable "ec2_instance_type" {
  type = string
  default = "t2.micro"
}

variable "ec2_associate_public_ip_address" {
  type = bool
  default = true
}

variable "tag_owner"{
  type = string
}

variable "tag_name_prefix"{
  type = string
}

variable "env_name"{
  type = string
}

variable "rds_host" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_port" {
  type = string
}

variable "db_username" {
  type = string
}

variable "bucket_name" {
  type = string
  default = "rwozniak-s3"
}

variable "db_yum_programs" {
  type = list
  default = ["pip", "git", "postgresql.x86_64"]
}

variable "db_pip_programs" {
  type = list
  default = ["Flask", "sqlAlchemy", "psycopg2-binary", "boto3", "jsonify"]
}

variable "db_git_url" {
  type = string
  default = "https://github.com/wozniakrafal88/db_app.git"
}

variable "s3_yum_programs" {
  type = list
  default = ["pip", "git"]
}

variable "s3_pip_programs" {
  type = list
  default = ["Flask", "requests", "boto3"]
}

variable "s3_git_url" {
  type = string
  default = "https://github.com/wozniakrafal88/s3_app.git"
}

variable "db_app_name" {
  type = string
  default = "test_app"
}

variable "s3_app_name" {
  type = string
  default = "s3_app"
}

variable "rds_to_ec2_iam_profile" {
  type = string
}

variable "s3_jenkins_to_ec2_profile" {
  type = string
}

variable "jenkins_load_Balancer_url" {
  type = string
}