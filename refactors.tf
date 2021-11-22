moved {
  from = aws_apigatewayv2_api.lambda
  to   = module.lambda.aws_apigatewayv2_api.lambda
}

moved {
  from = aws_apigatewayv2_integration.hello_world
  to   = module.hello_world_function.aws_apigatewayv2_integration.function
}

moved {
  from = aws_apigatewayv2_route.hello_world
  to   = module.hello_world_function.aws_apigatewayv2_route.function
}

moved {
  from = aws_apigatewayv2_stage.lambda
  to   = module.lambda.aws_apigatewayv2_stage.lambda
}

moved {
  from = aws_cloudwatch_log_group.api_gw
  to   = module.lambda.aws_cloudwatch_log_group.api_gw
}

moved {
  from = aws_iam_role.lambda_exec
  to   = module.lambda.aws_iam_role.lambda_exec
}

moved {
  from = aws_iam_role_policy_attachment.lambda_policy
  to   = module.lambda.aws_iam_role_policy_attachment.lambda_policy
}

moved {
  from = aws_lambda_function.hello_world
  to   = module.hello_world_function.aws_lambda_function.function
}

moved {
  from = aws_cloudwatch_log_group.hello_world
  to   = module.hello_world_function.aws_cloudwatch_log_group.function
}

moved {
  from = aws_lambda_permission.api_gw
  to   = module.hello_world_function.aws_lambda_permission.api_gw
}

moved {
  from = aws_s3_bucket.lambda_bucket
  to   = module.lambda.aws_s3_bucket.lambda_bucket
}

moved {
  from = aws_s3_bucket_object.lambda_hello_world
  to   = module.hello_world_function.aws_s3_bucket_object.function
}

moved {
  from = random_pet.lambda_bucket_name
  to   = module.lambda.random_pet.lambda_bucket_name
}
