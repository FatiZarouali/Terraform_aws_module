variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
  
}
variable "azs" {
  type = list(string)
  
}
variable "private_subnet_cidr_blocks" {
  type        = list(string)
  description = "private subnet cidrs"
  
}