provider "aws" {
  region = "eu-west-2"
  shared_config_files = [ "/Users/adnanhussain/.aws/config" ]
  shared_credentials_files = [ "/Users/adnanhussain/.aws/credentials" ]
  profile = "adnan-aws"
}

module "ec2module" {
  source = "./ec2"
  ec2name = "Name from module"
}

output "module_output" {
  value = module.ec2module.instance_id
}