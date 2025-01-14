# main.tf

resource "null_resource" "foo2" {
  triggers = {
    foo = var.project
  }
}

module "sns_topic" {
  source  = "terraform-google-modules/cloud-nat/google"
  version = "2.2.0"
  name  = "simple"

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
