terraform {
  backend "s3" {
    bucket = "tfstate-bucket-220924"
    key = "pet/terraform.tfstate"
    region = "eu-west-3"
    dynamodb_table = "tfstate-table-220924"
  }
}