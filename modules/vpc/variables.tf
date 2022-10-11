variable "tag_owner"{
  type = string
}

variable "tag_name_prefix"{
  type = string
}

variable "env_name"{
  type = string
}

variable "vpc_cidr_block"{
  type = string
  default = "10.0.0.0/16"
}

variable "cidr_blocks_for_bastion" {
  type = string
  default = "188.114.87.23/32"
}

/*variable "public_subnet_cidrs" {
  type = list
  default = ["10.0.0.0/24","10.0.1.0/24"]
}*/

/*variable "private_subnet_cidrs" {
  type = map
  default = ["10.0.2.0/24","10.0.3.0/24"]
}*/

variable "public_subnets" {
  type = list(object({
    cidr_block = string
    availability_zone = string
  }))
  default = [{
    cidr_block = "10.0.0.0/24"
    availability_zone = "eu-west-1a"
  },
  {
    cidr_block = "10.0.1.0/24"
    availability_zone = "eu-west-1b"
  }
  ]
}

variable "private_subnets" {
  type = list(object({
    cidr_block = string
    availability_zone = string
  }))
  default = [{
    cidr_block = "10.0.2.0/24"
    availability_zone = "eu-west-1a"
  },
  {
    cidr_block = "10.0.3.0/24"
    availability_zone = "eu-west-1b"
  }
  ]
}