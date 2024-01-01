resource "aws_s3_bucket" "s3_trigger_eventbridge" {
  bucket = var.s3_bucket_name
  tags = {
    Name        = "Eventbridge S3 Bucket"
  }
  }

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket      = aws_s3_bucket.s3_trigger_eventbridge.id
  eventbridge = true
}