variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
  
}
variable "private_subnet_ids" {
  type        = list(string)
  description = ""
  
}
variable "private_subnet_cidr_blocks" {
  type    = list(string)
  
}