

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.2.0"

  name = "${var.environment}-vpc-v2"
  cidr = "10.0.0.0/16"

  azs             = ["eu-south-1a", "eu-south-1b", "eu-south-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = merge(var.tags_common, var.tags_network, )
}

