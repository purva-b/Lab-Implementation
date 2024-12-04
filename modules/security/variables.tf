variable "vpc_id" {
  type = string
}

variable "allowed_ingress_ports" {
  type    = list(number)
  default = [80, 443]
}

variable "allowed_egress_cidr" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "allowed_db_ports" {
  type    = list(number)
  default = [3306]
}
