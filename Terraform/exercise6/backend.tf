terraform {
  backend "s3" {
    bucket = "terraformstatebucket1277"
    key    = "terraform/backend_exercise6"
    region = "us-east-1"
  }
}