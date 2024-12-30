variable "vpcs" {
  description = "A map of VPC configurations"
  type = map(object({
    vpc_cidr_block     = string
    enable_dns_hostnames = bool
    enable_dns_support  = bool
    tags                = map(string)
    private_subnet_map  = map(any)
    private_subnets     = map(string)
    azs                 = list(string)
    all_private_subnet_ids = list(string)
    private_subnet_tags = map(string)
    private_subnet_list = list(object({
      cidr_block        = string
      availability_zone = string
      tags              = map(string)
    }))
  }))
}

variable "region" {
  description = "The AWS region to deploy resources into"
  type        = string
  default     = "eu-west-1"  # You can change this default to your desired region
}