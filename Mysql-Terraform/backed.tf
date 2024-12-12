terraform {
  backend "s3" {
    bucket = "batch28-final-tool"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
