module "prod_vpc_1" {
  source             = "../modules/network"
  vpc_cidr           = var.vpc_cidr
  vpc_name           = var.vpc_name
  environment        = var.environment
  public_cidr_block  = var.public_cidr_block
  private_cidr_block = var.private_cidr_block
  azs                = var.azs
  natgw_id = module.prod_natgw_1.natgw_id
}

module "prod_sg_1" {
  source        = "../modules/sg"
  vpc_name      = module.prod_vpc_1.vpc_name
  vpc_id        = module.prod_vpc_1.vpc_id
  environment   = module.prod_vpc_1.environment
  service_ports = ["80", "443", "445", "8080", "22", "3389", "1433", "3306"]
}

module "prod_natgw_1" {
  source        = "../modules/nat"
public_subnet_id = module.prod_vpc_1.public_subnets_id_1
vpc_name = module.prod_vpc_1.vpc_name
}

# module "prod_vpc_2" {
#   source             = "../modules/network"
#   vpc_cidr           = "172.30.0.0/16"
#   vpc_name           = "prod_vpc_2"
#   environment        = "Production"
#   public_cidr_block  = ["172.30.1.0/24", "172.30.2.0/24", "172.30.3.0/24"]
#   private_cidr_block = ["172.30.10.0/24", "172.30.20.0/24", "172.30.30.0/24"]
#   azs                = ["us-east-1a", "us-east-1b", "us-east-1c"]
# }