# main.tf
resource "null_resource" "foo2" {
  triggers = {
    foo = var.project
  }
}
