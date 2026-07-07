module "aws_s3" {
  source = "git@github.com:kn47ytv9mv/aws-s3//::"

  tags = {
    description = title(var.description)
  }
}

