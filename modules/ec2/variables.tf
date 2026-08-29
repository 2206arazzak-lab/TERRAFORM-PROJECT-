variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "public_key_path" {
  type = string
}

variable "ssh_cidr" {
  type = string
}

variable "security_group_name" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "common_tags" {
  type = map(string)
}
