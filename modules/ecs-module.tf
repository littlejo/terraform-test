locals {
    env_string = "string_var"
}

module "container" {
  source  = "cloudposse/ecs-container-definition/aws"
  container_name  = "name"
  container_image = "nginx"

  environment = [
    {
      name  = local.env_string
      value = "123"
    },
    {
      name  = "another_string_var"
      value = "true"
    },
    {
      name  = "yet_another_string_var"
      value = "false"
    }
  ]
}

output "json" {
  description = "Container definition in JSON format"
  value       = module.container.json
}
