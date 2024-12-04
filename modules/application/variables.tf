variable "vpc_id" {
  type = string
}

variable "security_sg" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "frontend_ami" {
  type    = string
  default = "ami-007868005aea67c54" # Example AMI
}

variable "frontend_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "backend_ami" {
  type    = string
  default = "ami-007868005aea67c54" # Example AMI
}

variable "backend_instance_type" {
  type    = string
  default = "t2.micro"
}

