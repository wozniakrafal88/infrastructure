variable "vpc_id" {
  type = string
}

variable "sc_lb_id" {
  type = string
}


variable "public_subnet_ids" {
  type = list
}

variable "sc_apps_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list
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

variable "ec2_jenkins_id" {
  type = string
}

variable "app_info" {
  type = list(object({
    name = string
    port = string
    task_definition_arn = string
    sd_service_arn = string
  }))
}
