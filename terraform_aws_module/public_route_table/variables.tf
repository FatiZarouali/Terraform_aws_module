variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
  
}
variable "internet_gateway_id" {
  type        = string
  description = ""
  
}
variable "public_subnet_cidr_blocks" {
  type = list(string)
  
}
variable "public_subnet_ids" {
  type        = string
  description = ""
  
}