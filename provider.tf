terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.8"
    }
  }

  # set TF CLI version
  required_version = "~> 1.1"

  # use Terraform Cloud as state backend
  cloud {
    organization = "jkc-projects"
  }
}

provider "aws" {
  alias  = "development"
  region = "eu-west-1"

  access_key = var.DEV_dns_deployer_AWS_ACCESS_KEY_ID
  secret_key = var.DEV_dns_deployer_AWS_SECRET_ACCESS_KEY

  default_tags {
    tags = local.default_tags
  }
}

provider "aws" {
  alias  = "PRODUCTION"
  region = "eu-west-1"

  access_key = var.PROD_dns_deployer_AWS_ACCESS_KEY_ID
  secret_key = var.PROD_dns_deployer_AWS_SECRET_ACCESS_KEY

  default_tags {
    tags = local.default_tags
  }
}