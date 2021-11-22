locals {
  function_name = basename(var.source_path)
}

data "archive_file" "function" {
  type = "zip"

  source_dir  = var.source_path
  output_path = "${var.source_path}.zip"
}

resource "aws_s3_bucket_object" "function" {
  bucket = var.bucket_id

  key    = basename(data.archive_file.function.output_path)
  source = data.archive_file.function.output_path

  etag = filemd5(data.archive_file.function.output_path)
}

resource "aws_lambda_function" "function" {
  function_name = local.function_name

  s3_bucket = var.bucket_id
  s3_key    = aws_s3_bucket_object.function.key

  runtime = "nodejs12.x"
  handler = "index.handler"

  source_code_hash = data.archive_file.function.output_base64sha256

  role = var.role_arn
}

resource "aws_cloudwatch_log_group" "function" {
  name = "/aws/lambda/${local.function_name}"

  retention_in_days = 30
}

resource "aws_apigatewayv2_integration" "function" {
  api_id = var.gateway_id

  integration_uri    = aws_lambda_function.function.invoke_arn
  integration_type   = "AWS_PROXY"
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "function" {
  api_id = var.gateway_id

  route_key = "GET /${local.function_name}"
  target    = "integrations/${aws_apigatewayv2_integration.function.id}"
}

resource "aws_lambda_permission" "api_gw" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.function.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${var.gateway_execution_arn}/*/*"
}

