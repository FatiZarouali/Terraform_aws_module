variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
  
}
variable "nat_gateway_id" {
  type        = list(string)
  description = ""
  
}
variable "private_subnet_ids" {
  type = list(string)
  
}
variable "private_subnet_cidr_blocks" {
  type = list(string)
  
}
