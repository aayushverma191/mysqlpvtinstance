output "vpc_id" {
  description = "The ID of the MySQL VPC"
  value       = aws_vpc.mysql_vpc.id
}

output "vpc_id_print" {
  description = "A list of MySQL VPC IDs (printed)"
  value       = aws_vpc.mysql_vpc[*].id
}

output "pub_subnet_id" {
  description = "A list of IDs for the public subnets"
  value       = aws_subnet.public[*].id
}

output "pvt_subnet_id" {
  description = "A list of IDs for the private subnets"
  value       = aws_subnet.private[*].id
}
