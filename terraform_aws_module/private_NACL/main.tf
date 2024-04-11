# Create network ACL for private subnets
resource "aws_network_acl" "private_acl" {
  vpc_id = var.vpc_id

  # Inbound rules for private subnet ACL
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block  = var.private_subnet_cidr_blocks[count.index]
    from_port  = 80
    to_port    = 80
  }

  # Outbound rules for private subnet ACL
  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }
}

# Associate private subnet ACL with each private subnet
resource "aws_subnet_network_acl_association" "private_acl_association" {
  count          = length(var.private_subnet_ids)
  subnet_id      = var.private_subnet_ids[count.index]
  network_acl_id = aws_network_acl.private_acl.id
}
