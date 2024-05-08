output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "subnet_ids" {
  value = { for s in aws_subnet.subnets : s.tags["Name"] => s.id }
}

output "public_subnet_ids" {
  value = {
    for s in aws_subnet.subnets : s.id => s.id
    if contains(split("-", s.tags["Name"]), "public")
  }
}

output "private_subnet_ids" {
  value = {
    for s in aws_subnet.subnets : s.id => s.id
    if contains(split("-", s.tags["Name"]), "private")
  }
}



output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gw.id
}
