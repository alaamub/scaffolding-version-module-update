resource "terraform_data" "resourcely_metadata" {
  input = {
     version = 1
     modules = file(".terraform/modules/modules.json")
  }
}
