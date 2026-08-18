module "aws_vpc" {
  source = "git@github.com:kn47ytv9mv/aws-vpc"
}

module "aws_jenkins" {
  source = "git@github.com:kn47ytv9mv/aws-jenkins"

  private_subnet_ids = module.aws_vpc.private_subnet_ids
  public_subnet_ids  = module.aws_vpc.public_subnet_ids
  domain             = module.aws_vpc.domain_name
  route53_zone_id    = module.aws_vpc.route53_zone_id
  vpc_id             = module.aws_vpc.vpc_id
}

import {
  id = var.backend
  to = aws_s3_bucket.backend
}

resource "aws_s3_bucket" "backend" {
  bucket = var.backend

  tags = {
    title("description") = title(var.backend_description)  
  }
}

