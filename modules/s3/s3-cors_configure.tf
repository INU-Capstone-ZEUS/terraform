resource "aws_s3_bucket_cors_configuration" "example" {
  bucket = aws_s3_bucket.s3.id

  cors_rule {
      allowed_headers = ["*"]
      allowed_methods = ["GET", "POST", "PUT"]
      allowed_origins = ["*"]
      expose_headers  = ["ETag"]
      max_age_seconds = 3000
  }
}