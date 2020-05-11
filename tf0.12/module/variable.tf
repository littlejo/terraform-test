variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
}

variable "name" {
  type        = string
  default     = "sg_name"
}


variable "description" {
  type        = string
  default     = "sg description"
}

variable "cidr_blocks" {
  type        = string
  default     = "0.0.0.0/0"
}

