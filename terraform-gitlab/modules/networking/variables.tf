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

variable "tags_network" {
  default = {
    Module = "network"
  }
  description = "Network Tags for a specific environment"
  type        = map(string)
}

