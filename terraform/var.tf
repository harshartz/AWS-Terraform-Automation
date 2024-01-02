variable "s3_bucket_name" {
  type        = string
  description = "AWS S3 bucket name"
  default     = "" # Add the globally unique bucket name to this variable 
}

variable "aws_region" {
    type        = string
    description = "AWS region where resources will be created"
    default     = "ap-south-1"  # Set the appropriate AWS region code here
}