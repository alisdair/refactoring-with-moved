terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.48.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.2.0"
    }
  }

  required_version = "~> 1.1.0"
}

provider "aws" {
  region = var.aws_region
}

module "lambda" {
  source = "./modules/lambda"
}

module "hello_world_function" {
  source = "./modules/function"

  source_path           = "${path.module}/hello-world"
  role_arn              = module.lambda.role_arn
  bucket_id             = module.lambda.bucket_id
  gateway_id            = module.lambda.gateway_id
  gateway_execution_arn = module.lambda.gateway_execution_arn
}
