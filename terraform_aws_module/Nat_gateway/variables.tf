variable "public_subnet_ids" {
  type        = list(string)
  description = "subnet public ids"
  
}
variable "internet_gateway" {
  type        = string
  description = "internet gateway"
  
}
