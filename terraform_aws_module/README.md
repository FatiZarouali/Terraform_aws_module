# Terraform_aws_module
 This repository contains a Terraform module for provisioning the following AWS services: 
 - VPC 
 - Private subnet
 - Public subnet 
 - NACL (Network Access Control List)
 - Internet gateway
 - NAT gateway
 - Route tables.
 # Requirement
 You have two options to configure AWS credentials:
 - Set environment variables in $HOME/.aws/credentials.
 - Utilize a cloud-based solution for storing key vaults.
In this case, I've opted for the first option.
Install terraform and jenkins.
# Overview
The Terraform configuration in this repository enables the creation of AWS infrastructure components required for setting up a network environment. These components are essential for hosting applications and services in AWS with proper network isolation and security.

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

- the main.tf Contains the resource configurations to create.
- the variables.tf: Contains variable definitions.
- the variables.tfvars: Contains the values for each variable, facilitating the process and enabling the creation of various services for different environments using the same modules, with modifications only to variable values.
- the version.tf: Includes the versions utilized in this project.
- the terraform_state_config.tf: Consists of the configuration for the S3 bucket where we store the Terraform state.

# Usage
Customize the values in variables.tfvars according to your requirements, specifying parameters such as VPC CIDR, subnet CIDR blocks, AZs, etc.

Create a Pipeline job in jenkins and use jenkinsfile to clone the code from github and run Terraform Commands. 

