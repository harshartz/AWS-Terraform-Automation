# Terraform AWS Lambda S3 Event

## Overview

This project is a solution to a task assigned during the hiring process. The goal is to create an AWS Lambda function triggered by an EventBridge notification event when a CSV file is added to a specified S3 bucket. The lambda function is designed to print the contents of the CSV file to CloudWatch log streams.

## Prerequisites

Before you begin, make sure that Terraform and the AWS CLI are configured on your system. If not, you can install the AWS CLI and configure it using the command:

```
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


