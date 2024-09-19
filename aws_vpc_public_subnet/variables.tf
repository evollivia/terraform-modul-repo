variable "vpc_cidr" {
  description = "vpc cidr of subnet"
  type = string
}

variable "subnet_cidr" {
  description = "cidr of subnet"
  type = string
}

variable "avail_zone" {
  description = "availability zone of subnet"
  type = string
}

variable "inbound_ports" {
  description = "inbound ports of subnet"
  type = list(object({
    port = number
    protocol = optional(string, "tcp")  # optional : terraform 1.3.0 이상만 사용 가능
    cidr_blocks = optional(list(string), ["0.0.0.0/0"])
  }))
}

variable "instance_name" {
  description = "instance name of subnet"
  type = string
}

