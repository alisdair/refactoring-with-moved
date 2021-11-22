output "hello_world_url" {
  value = "${module.lambda.gateway_url}/${module.hello_world_function.function_name}"
}
