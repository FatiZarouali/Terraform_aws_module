# Terraform_aws_module
 This repository contains a Terraform module for provisioning the following AWS services: VPC, private subnet, public subnet, NACL (Network Access Control List), internet gateway, NAT gateway, and route tables.
 # Requirement
 You have two options to configure AWS credentials:
 - Set environment variables in $HOME/.aws/credentials.
 - Utilize a cloud-based solution for storing key vaults.
In this case, I've opted for the first option.
Install terraform and jenkins.
# Set up
In this Repository you will find folders that define the following AWS module:
- VPC module to create a VPC service.
- public_subnet module to create public subnets.
- private_subnet module to create private subnets.
- intenet_gateway module to create an internat gateway.
- nat_gateway module to create Nat gateways.
- private_route_tablemodule to create private route tables.
- public_route_table to create a public route table.
- private_NACL to create a public NACL for private subnets.
- public_NACL to create a public NACL for private subnets.
- In each folder you will find a README.md file to describe the configuration.

the main.tf Contains the resource configurations to create.
the variables.tf: Contains variable definitions.
the variables.tfvars: Contains the values for each variable, facilitating the process and enabling the creation of various services for different environments using the same modules, with modifications only to variable values.
the version.tf: Includes the versions utilized in this project.
the backend.tf: Consists of the configuration for the S3 bucket where we store the Terraform state.

