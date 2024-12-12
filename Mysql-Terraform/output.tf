output "vpc_id" {
  description = "ID of the VPC created by the networking module"
  value       = module.netwoking.vpc_id_print
}

output "pub_subnet_id" {
  description = "IDs of the public subnets created by the networking module"
  value       = module.netwoking.pub_subnet_id
}

output "pvt_subnet_id" {
  description = "IDs of the private subnets created by the networking module"
  value       = module.netwoking.pvt_subnet_id
}

output "Instance_id_public" {
  description = "IDs of the public EC2 instances created by the security module"
  value       = module.Security.Instance_id_public
}

output "Instance_id_private" {
  description = "IDs of the private EC2 instances created by the security module"
  value       = module.Security.Instance_id_private
}

output "IP_Public_Bastion" {
  description = "Public IP address of the bastion EC2 instance created by the security module"
  value       = module.Security.Bastion_Public_IP
}
