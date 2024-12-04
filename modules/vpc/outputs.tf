output "vpc_id_1" {
  value = module.vpc.vpc_id
}

output "public_subnets_1" {
  value = module.vpc.public_subnets
}

output "private_subnets_1" {
  value = module.vpc.private_subnets
}
