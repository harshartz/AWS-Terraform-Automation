variable "aws_region" {
  description = "AWS region where resources will be created"
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  default     = "your-unique-s3-bucket-name"
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  default     = "your_lambda_function_name"
}