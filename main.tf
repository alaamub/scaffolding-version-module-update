# main.tf

resource "null_resource" "foo2" {
  triggers = {
    foo = var.project
  }
}

module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.4.0"
}
