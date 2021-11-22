output "bucket_id" {
  value = aws_s3_bucket.lambda_bucket.id
}

output "role_arn" {
  value = aws_iam_role.lambda_exec.arn
}

output "gateway_id" {
  value = aws_apigatewayv2_api.lambda.id
}

output "gateway_execution_arn" {
  value = aws_apigatewayv2_api.lambda.execution_arn
}

output "gateway_url" {
  value = aws_apigatewayv2_stage.lambda.invoke_url
}
