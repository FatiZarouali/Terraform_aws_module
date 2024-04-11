provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./VPC"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
}

module "public_subnets" {
  source = "./public_subnet"
  vpc_id = module.vpc.vpc_id
  public_subnet_cidr_blocks = var.public_subnet_cidr_blocks
  azs = var.azs
}

module "private_subnets" {
  source = "./private_subnet"

  vpc_id = module.vpc.vpc_id
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  azs = var.azs
}

module "internet_gateway" {
  source = "./internet_gateway"

  vpc_id = module.vpc.vpc_id
  internet_gateway_name = var.internet_gateway_name
}

module "nat_gateways" { 
  source = "./nat_gateway"

  internet_gateway = module.internet_gateway
  public_subnet_ids = module.public_subnets.*.id
}

module "public_acl" {  //to add a private acl and  a public acl
  source = "./public_NACL"

  vpc_id = module.vpc.vpc_id
  public_subnet_ids    = module.public_subnets.*.id
}
module "private_acl" {  //to add a private acl and  a public acl
  source = "./private_NACL"
  vpc_id = module.vpc.vpc_id
  private_subnet_cidr_blocks = module.private_subnets.private_subnet_cidr_blocks
  private_subnet_ids    = module.private_subnets.*.id
}

module "public_route_tables" {
  source = "./public_route_table"

  vpc_id               = module.vpc.vpc_id
  public_subnet_ids    = module.public_subnets.*.id
  internet_gateway_id  = module.internet_gateway.internet_gateway_id
  public_subnet_cidr_blocks = var.public_subnet_cidr_blocks
}
module "private_route_tables" {
  source = "./private_route_table"
  vpc_id               = module.vpc.vpc_id
  private_subnet_ids   = module.private_subnets.*.id
  nat_gateway_id       = module.nat_gateways.nat_gateway_ids
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
}
