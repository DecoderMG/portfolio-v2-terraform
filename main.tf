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

resource "aws_iam_policy" "s3_read_policy" {
  name        = "s3_read_policy"
  path        = "/"
  description = "Policy allowing AWS resources to read S3 bucket contents for ${aws_s3_bucket.portfolio_data_files_bucket.bucket} bucket"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
            "logs:PutLogEvents",
            "logs:CreateLogGroup",
            "logs:CreateLogStream"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:logs:*:*:*"
      },
      {
        Action = [
            "s3:GetObject",
        ]
        Effect = "Allow"
        Resource = "arn:aws:s3:::${aws_s3_bucket.portfolio_data_files_bucket.bucket}/*"
      }
    ]
  })
}