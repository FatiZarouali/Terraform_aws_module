
# Create network ACL for public subnets
resource "aws_network_acl" "public_acl" {
  vpc_id = var.vpc_id

  # Inbound rules for public subnet ACL
  ingress {
    protocol    = "tcp"
    rule_no    = 300
    action = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 80
    to_port     = 80
  }

  # Outbound rules for public subnet ACL
  egress {
    protocol    = "tcp"
    rule_no    = 400
    action = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 443
    to_port     = 443
  }
}

# Associate public subnet ACL with each public subnet
resource "aws_subnet_network_acl_association" "public_acl_association" {
  count          = length(var.public_subnet_ids)
  subnet_id      = var.public_subnet_ids[count.index]
  network_acl_id = aws_network_acl.public_acl.id
}

