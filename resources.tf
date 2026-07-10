module "aws_vpc" {
  source = "git@github.com:kn47ytv9mv/aws-vpc"
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

