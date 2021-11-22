output "hello_world_url" {
  value = "${module.lambda.gateway_url}/${module.hello_world_function.function_name}"
}

output "goodbye_world_url" {
  value = "${module.lambda.gateway_url}/${module.goodbye_world_function.function_name}"
}
