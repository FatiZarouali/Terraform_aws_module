resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }
   route {
    cidr_block = var.public_subnet_cidr_blocks[count.index]
    gateway_id = "local"
  }

  tags = {
    Name = "Public Route Table"
  }
}
# Create three instances of aws_route_table_association to associate each public subnet with the route table
resource "aws_route_table_association" "public_subnet_route_table_association" {
  count = length(var.public_subnet_ids)

  subnet_id      = var.public_subnet_ids[count.index]
  route_table_id = aws_route_table.public_route_table.id
}