variable "ami" {
  description = "ami of instance"
  type = string
}

variable "instance_type" {
  description = "instance type of instance"
  type = string
}

variable "key_name" {
  description = "key name of instance"
  type = string
}

variable "instance_name" {
  description = "instance name for instance"
  type = string
}

variable "security_group_id" {
  description = "id for assign to instance"
  type = string
}
