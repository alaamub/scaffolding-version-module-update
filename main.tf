# main.tf

resource "null_resource" "foo2" {
  triggers = {
    foo = var.project
  }
}

module "pet" {
  source  = "carljavier/pet/random"
  version = "1.0.5"
}
