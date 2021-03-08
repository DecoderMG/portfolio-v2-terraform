terraform {
  backend "s3" {
    bucket = "terraform-dakota-portfolio-state-bucket"
    key    = "terraform/portfolio"
    region = "us-east-1"
  }
}