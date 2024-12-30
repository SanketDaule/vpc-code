
module "vpc" {
  for_each = var.vpcs 

  source = "./modules/vpc-module"  # Path to your VPC module

  vpc_cidr_block           = each.value.vpc_cidr_block
  enable_dns_hostnames     = each.value.enable_dns_hostnames
  enable_dns_support       = each.value.enable_dns_support
  tags                     = each.value.tags
  private_subnet_map       = each.value.private_subnet_map
  private_subnets          = each.value.private_subnets
  azs                      = each.value.azs
  all_private_subnet_ids   = each.value.all_private_subnet_ids
  private_subnet_tags      = each.value.private_subnet_tags
  private_subnet_list      = each.value.private_subnet_list
}