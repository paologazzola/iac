terraform {
  backend "http" {}
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "networking" {
  source       = "../modules/networking"
  tags_common  = var.tags_common
  tags_network = var.tags_network
}

module "lambdas" {
  source       = "../modules/lambdas"
  tags_common  = var.tags_common
  tags_lambdas = var.tags_lambdas
}
