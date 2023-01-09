provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Initiative       = local.initative
      Owner            = local.owner
      Manager          = local.manager
    #   BackendBucket    = data.backend_bucket
      BackendKey       = local.backend_key
      DeleteProtection = local.delete_protection
    }
  }
}

terraform {
  backend "s3" {
    bucket = data.backend_bucket
    key    = local.backend_key
    region = var.aws_region
  }
}