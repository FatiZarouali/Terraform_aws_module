resource "aws_subnet" "private_subnets" {
  count             = length(var.azs)
  vpc_id            = var.vpc_id
  availability_zone = element(var.azs, count.index)
  cidr_block        = element(var.private_subnet_cidr_blocks, count.index)

  tags = {
    Name = "Private Subnet ${count.index + 1}"
  }
}
