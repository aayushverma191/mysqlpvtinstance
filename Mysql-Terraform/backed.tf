terraform {
  backend "s3" {
    bucket = "kwibnwuygwby"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
