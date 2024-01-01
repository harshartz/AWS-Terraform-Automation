data "archive_file" "lambda" {
  type        = "zip"
  source_file  = "${path.module}/lambda_function.py"
  output_path = "${path.module}/lambda_function.zip"
}

resource "aws_lambda_function" "test_lambda" {

  filename      = "lambda_function.zip"
  function_name = "s3_eventbridge_lambda"
  role          = aws_iam_role.iam_for_lambda.arn
  handler = "lambda_function.lambda_handler"
  architectures = ["arm64"]
  source_code_hash = data.archive_file.lambda.output_base64sha256
  runtime = "python3.12"
  memory_size   = 256
  publish       = true
  tracing_config {
    mode = "Active"
  }
}

resource "aws_cloudwatch_log_group" "lambda_logs" {
  name              = "/aws/lambda/${aws_lambda_function.test_lambda.function_name}"
  retention_in_days = 30
}

resource "aws_lambda_permission" "s3_eventbridge_permission" {
  statement_id  = "AllowS3Event"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.test_lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.event_rule.arn
}