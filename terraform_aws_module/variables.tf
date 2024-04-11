variable "region" {
  type = string
  description = "region"
  
}
variable "vpc_cidr" {
  type        = string
  description = "the cidr of the vpc"
  
}
variable "vpc_name" {
  type = string
  description = "the name of the vpc"
}
variable "azs" {
  type        = list(string)
  description = "the az to use"
}
variable "public_subnet_cidr_blocks" {
    type = list(string)
    description = "public subnet cidr blocks"
  
}
variable "private_subnet_cidr_blocks" {
    type = list(string)
    description = "private subnet cidr blocks"
  
}
variable "internet_gateway_name" {
    type = string
    description = "the name of internet gateway"
  
}
variable "backet_name" {
  type = string
  description = "S3 backet name to store terraform state"
  
}
variable "backet_key" {
  type = string
  description = "S3 backet key to store terraform state"
  
}