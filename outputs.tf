output "hello_world_url" {
  value = "${aws_apigatewayv2_stage.lambda.invoke_url}/${aws_lambda_function.hello_world.function_name}"
}
