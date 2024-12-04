variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "private_subnets" {
  type = list(string)
}

variable "private_sg_id" {
  type = string
}
