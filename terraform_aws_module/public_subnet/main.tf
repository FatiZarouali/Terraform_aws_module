resource "aws_subnet" "public_subnets" {
  count             = length(var.azs)
  vpc_id            = var.vpc_id
  availability_zone = element(var.azs, count.index)
  cidr_block        = element(var.public_subnet_cidr_blocks, count.index)

  tags = {
    Name = "Public Subnet ${count.index + 1}"
  }
}
