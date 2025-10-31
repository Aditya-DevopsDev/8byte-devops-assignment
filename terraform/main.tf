resource "aws_s3_bucket" "app_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "8byte-devops-bucket"
    Environment = "Local"
  }
}
