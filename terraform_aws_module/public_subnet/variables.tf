variable "vpc_id" {
  type        = string
  description = "The IP range to use for the VPC"
  
}
variable "public_subnet_cidr_blocks" {
  type        = list(string)
  description = "public subnet cidrs"
  
}
variable "azs" {
  type        = string
  description = "th AZ to use"
  
}