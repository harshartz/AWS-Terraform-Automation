# Terraform AWS Lambda S3 Event

## Task Details

The provided technical task was to create an AWS S3 Bucket, an EventBridge rule, and an AWS Lambda function using Terraform code. The objective is to trigger the Lambda function whenever a CSV file is added to the S3 bucket, with the Lambda function printing the CSV file data.

## Overview

This project is a direct response to the provided technical task. The goal is to create an AWS Lambda function triggered by an EventBridge notification event whenever a CSV file is added to a designated S3 bucket. The Lambda function is specifically designed to print the contents of the CSV file to CloudWatch log streams.

## Prerequisites

Before getting started, ensure that Terraform and the AWS CLI are configured on your system. If not already done, you can install the AWS CLI and configure it using the command:

```bash
aws configure
```

## Getting Started

1. Clone this repository:

```bash
git clone https://github.com/harshartz/AWS-Terraform-Automation.git
cd AWS-Terraform-Automation/terraform
```

2. Edit the `var.tf` file to provide the necessary values. Update the AWS region and choose a globally unique S3 bucket name.

3. Run Terraform commands to create the infrastructure:

```bash
terraform init
terraform apply
```

4. Once the infrastructure is created, you can verify the functionality by uploading CSV files with different extensions to the specified S3 bucket. The Lambda function will only trigger when a CSV file is uploaded.

5. View the output in CloudWatch log streams to see the printed data from the CSV file.

Feel free to explore and adapt this project according to your specific requirements. If you encounter any issues or have suggestions for improvements, please open an issue on this repository.
