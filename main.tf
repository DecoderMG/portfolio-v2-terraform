resource "aws_s3_bucket" "portfolio_data_files_bucket" {
  bucket = "terraform-dakota-portfolio-data-files-bucket"
  acl    = "private"


versioning {
    enabled = true
  }

  tags = {
    Project        = "My Portfolio"
    ManagedBy      = "Terraform"
  }
}