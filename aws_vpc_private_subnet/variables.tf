variable "vpc_id" {
  description = "VPC ID"
  type = string
}

variable "instance_name" {
  description = "instance name of subnet"
  type = string
}

variable "subnets" {
  type = map(object({
    cidr_block = string
    avail_zone = string
    ingress_ports = list(number)
  }))
}

variable "public_subnet_id" {
  description = "id of public subnet"
  type = string
}

variable "public_igw_id" {
  description = "internet gateway of subnet"
  type = string
}

