# # routes to allow internet access for instances in private subnets via the NAT Gateway
# # and to instances in public subnets via the Internet Gateway
# resource "aws_route_table" "private" {
#   vpc_id = aws_vpc.training.id

#   route = [
#     {
#       cidr_block                 = "0.0.0.0/0"
#       nat_gateway_id             = aws_nat_gateway.training.id
#       carrier_gateway_id         = ""
#       core_network_arn           = ""
#       destination_prefix_list_id = ""
#       egress_only_gateway_id     = ""
#       gateway_id                 = ""
#       instance_id                = ""
#       ipv6_cidr_block            = ""
#       local_gateway_id           = ""
#       network_interface_id       = ""
#       transit_gateway_id         = ""
#       vpc_endpoint_id            = ""
#       vpc_peering_connection_id  = ""
#     }
#   ]

#   tags = {
#     Name = "private"
#     vpc  = "training"
#   }
# }

# resource "aws_route_table" "public" {
#   vpc_id = aws_vpc.training.id

#   route = [
#     {
#       cidr_block                 = "0.0.0.0/0"
#       nat_gateway_id             = ""
#       carrier_gateway_id         = ""
#       core_network_arn           = ""
#       destination_prefix_list_id = ""
#       egress_only_gateway_id     = ""
#       gateway_id                 = aws_internet_gateway.training.id
#       instance_id                = ""
#       ipv6_cidr_block            = "::/0"
#       local_gateway_id           = ""
#       network_interface_id       = ""
#       transit_gateway_id         = ""
#       vpc_endpoint_id            = ""
#       vpc_peering_connection_id  = ""
#     },
#   ]

#   tags = {
#     Name = "public"
#     vpc  = "training"
#   }
# }

# resource "aws_route_table_association" "private-us-east-1a" {
#   subnet_id      = aws_subnet.private-us-east-1a.id
#   route_table_id = aws_route_table.private.id
# }

# resource "aws_route_table_association" "private-us-east-1b" {
#   subnet_id      = aws_subnet.private-us-east-1b.id
#   route_table_id = aws_route_table.private.id
# }

# resource "aws_route_table_association" "public-us-east-1a" {
#   subnet_id      = aws_subnet.public-us-east-1a.id
#   route_table_id = aws_route_table.public.id
# }

# resource "aws_route_table_association" "public-us-east-1b" {
#   subnet_id      = aws_subnet.public-us-east-1b.id
#   route_table_id = aws_route_table.public.id
# }