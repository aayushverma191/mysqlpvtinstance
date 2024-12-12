variable "inbound_ports" {
  description = "List of inbound ports and protocols"
  type        = list(map(any))  # Update the type constraint to allow any type
  default     = [
    { port = 80, protocol = "tcp" },
    { port = 22, protocol = "tcp" },
    { port = 443, protocol = "tcp" },
    { port = -1, protocol = "icmp" },
  ]
}

variable "outbound_ports" {
  description = "List of outbound ports and protocols"
  type        = list(map(any))
  default     = [
    { port = 0, protocol = "-1" },
  ]
}

variable "bastion_instance_name" {
  description = "Name for the bastion EC2 instance"
  type        = string
  default     = "bastion-instance"
}

variable "associate_public_ip_address" {
  description = "Associate a public IP address with the instance"
  type        = bool
  default     = true
}

variable "volume_size" {
  description = "Root volume size for the instance"
  type        = number
  default     = 29
}

variable "pvt_instance_name" {
  description = "List of names for private EC2 instances"
  type        = list(string)
  default     = ["mysql-master", "mysql-slave"]
}

variable "pvt_instance_name_02" {
  description = "Name of private EC2 instance"
  type        = string
  default     = "mysql"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "sec_grp" {
  description = "ID of the security group for EC2 instances"
  type        = string
  default     = "mysql_sg"
}

variable "ingress_cidr_blocks" {
  description = "CIDR blocks for inbound traffic"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_cidr_blocks" {
  description = "CIDR blocks for outbound traffic"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "key_name" {
  description = "Name of the key pair for EC2 instances"
  type        = string
  default     = "mysql"
}

variable "pub_sub_id" {
  description = "ID of the public subnet for EC2 instances"
  type        = string
}

variable "pvt_sub_id" {
  description = "List of IDs for private subnets for EC2 instances"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID of the VPC for EC2 instances"
  type        = string
}
