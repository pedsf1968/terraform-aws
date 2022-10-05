module "ec2-module" {
  source = "./ec2"
  ec2-name = "Name from module"
}

output "module-output" {
  value = module.ec2-module.instance-id
}
