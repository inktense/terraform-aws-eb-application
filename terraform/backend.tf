terraform {
  backend "s3" {
    bucket = "tf-state-202201108659685447"
    key    = "terraform-stf.tfstate"
    region = "eu-west-2"
  }
}
