
# Create route tables for each NAT gateway
resource "aws_route_table" "private_route_table" {
  count = length(var.private_subnet_ids)

  vpc_id = var.vpc_id
  route {
    cidr_block = var.private_subnet_cidr_blocks[count.index]
    gateway_id = "local"
  }
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id[count.index]
  }

  tags = {
    Name = "Private Route Table AZ${count.index + 1}"
  }
}

# Create route table associations for each private subnet
resource "aws_route_table_association" "private_subnet_association" {
  count = length(var.private_subnet_ids)

  subnet_id      = var.private_subnet_ids[count.index]
  route_table_id = aws_route_table.private_route_table[count.index].id
}