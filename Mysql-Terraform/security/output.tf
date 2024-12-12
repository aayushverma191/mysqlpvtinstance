output "Instance_id_public" {
  description = "IDs of the public EC2 instances"
  value       = aws_instance.bastion[*].id
}

output "Instance_id_private" {
  description = "IDs of the private EC2 instances"
  value       = aws_instance.private-ec2[*].id
}

output "Bastion_Public_IP" {
  description = "Public IP address of the bastion EC2 instance"
  value       = aws_instance.bastion.public_ip
}
