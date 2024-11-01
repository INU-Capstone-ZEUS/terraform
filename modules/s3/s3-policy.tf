resource "aws_s3_bucket_policy" "bucket-policy" {
  bucket = aws_s3_bucket.s3.id

  depends_on = [
    aws_s3_bucket_public_access_block.public-access
  ]

  policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"PublicRead",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::${aws_s3_bucket.s3.id}/*"]
    }
  ]
}
POLICY
}