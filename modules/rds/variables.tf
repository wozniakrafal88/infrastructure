variable "vpc_id" {
  type = string
}

variable "sc_db_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list
}

variable "engine"{
  type = string
  default = "postgres"
}

variable "engine_version"{
  type = string
  default = "13.4"
}

variable "instance_class"{
  type = string
  default = "db.t3.micro"
}

variable "username"{
  type = string
  default = "postgres"
}

variable "password"{
  type = string
  default = "password"
}

variable "skip_final_snapshot"{
  type = bool
  default = true
}

variable "iam_database_authentication_enabled"{
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