# Configuration:

It creates route tables for private subnets.

Private route table includes a local route for intra-VPC communication and a route to the NAT Gateway for outbound internet access.

It associates the created route tables with their respective subnets, so it dynamically creates a corresponding number of private route tables based on the number of private subnets, associating each route table with its respective private subnet.

# Variables:
It defines the variables.
