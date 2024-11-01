resource "aws_s3_bucket" "s3" {
  bucket = "${var.common_info.env}-${var.common_info.service_name}-bucket"

  tags = {
    environment = "${var.common_tags.Environment}"
  }
}