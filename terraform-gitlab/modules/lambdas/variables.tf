variable "environment" {
  default = "development"
}

variable "tags_common" {
  default = {
    Terraform   = "true"
    Environment = "staging"
  }
  description = "Common Tags for a specific environment"
  type        = map(string)
}

variable "tags_lambdas" {
  default = {
    Module = "lambdas"
  }
  description = "Lambdas Tags for a specific environment"
  type        = map(string)
}

