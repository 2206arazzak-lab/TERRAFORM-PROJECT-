variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "availability_zone" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "public_subnet_name" {
  type = string
}

variable "internet_gateway_name" {
  type = string
}

variable "route_table_name" {
  type = string
}

variable "common_tags" {
  type = map(string)
}
