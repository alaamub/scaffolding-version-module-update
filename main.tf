# main.tf

resource "null_resource" "foo2" {
  triggers = {
    foo = var.project
  }
}

module "sns_topic" {
  source  = "terraform-aws-modules/sns/aws"

  name  = "simple"

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
