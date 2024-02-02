variable "environment" {
  default = "development"
}

variable "aws_access_key" {
  default = "YOUR_ADMIN_ACCESS_KEY"
}

variable "aws_secret_key" {
  default = "YOUR_ADMIN_SECRET_KEY"
}

variable "aws_region" {
  default = "eu-south-1"
}

variable "tags_common" {
  default = {
    Terraform   = "true"
    Environment = "development"
  }
  description = "Common Tags for a specific environment"
  type        = map(string)
}

variable "tags_network" {
  default = {
    Module = "network"
  }
  description = "Network Tags for a specific environment"
  type        = map(string)
}

variable "tags_lambdas" {
  default = {
    Module = "lambdas"
  }
  description = "Lambdas Tags for a specific environment"
  type        = map(string)
}
