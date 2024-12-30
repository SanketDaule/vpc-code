resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  tags                 = var.tags  # Tags from root module
}

resource "aws_subnet" "private" {
  for_each = var.private_subnet_map

  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  tags              = each.value.tags  # Tags from the subnet map
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.this.id
  tags   = var.tags  # Tags from root module
}

resource "aws_default_route_table" "default_route_table" {
  default_route_table_id = aws_vpc.this.default_route_table_id
  tags                   = var.tags  # Tags from root module
}

resource "aws_route_table_association" "private_route_table_association" {
  for_each = { for index, subnet_id in var.all_private_subnet_ids : index => subnet_id }

  subnet_id      = each.value
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_subnet" "private_subnets" {
  for_each = { for subnet in var.private_subnet_list : subnet.cidr_block => subnet }

  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  tags = merge(
    each.value.tags,  # Tags from the subnet object
    var.private_subnet_tags  # Additional subnet-specific tags
  )
}

data "aws_subnet" "this" {
  for_each = var.private_subnet_map
  id       = aws_subnet.private[each.key].id
}

data "aws_subnet" "subnets_from_objects" {
  for_each = { for subnet in var.private_subnet_list : subnet.cidr_block => subnet }
  id       = aws_subnet.private_subnets[each.value.cidr_block].id
}