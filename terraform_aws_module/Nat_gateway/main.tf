resource "aws_eip" "nat" {
  count = length(var.public_subnet_ids)
  domain    = "vpc"

  tags   = {
    Name = "Elastic IP for Nat Gateway "
  }
}
resource "aws_nat_gateway" "nat_gateway" {
  for_each = toset(var.public_subnet_ids)

  subnet_id = each.value
  allocation_id = aws_eip.nat[each.key].id
  # to ensure proper ordering, it is recommended to add an explicit dependency
  depends_on = [var.internet_gateway]
}
