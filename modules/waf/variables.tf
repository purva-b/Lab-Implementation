variable "name" {
  type = string
  default = "example-waf"
}

variable "rate_limit" {
  type    = number
  default = 2000
}

variable "allowed_ips" {
  type = list(string)
  default = ["203.0.113.0/24", "198.51.100.0/24"]
}
