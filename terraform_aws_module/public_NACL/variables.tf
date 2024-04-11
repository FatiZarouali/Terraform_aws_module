variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
  
}
variable "public_subnet_ids" {
  type        = list(string)
  description = "public subnet id"
  
}
