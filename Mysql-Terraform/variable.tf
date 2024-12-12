variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "Mysql"
}

variable "vpc_tenancy" {
  description = "Tenancy of the VPC"
  type        = string
  default     = "default"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "enable_dns_support" {
  description = "Enable DNS support for the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames for the VPC"
  type        = bool
  default     = true
}

variable "pub_sub_names" {
  description = "Names of the public subnets"
  type        = list(string)
  default     = ["mysql-pub-sub-01", "mysql-pub-sub-02"]
}

variable "pub_cidr" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.0.0/18", "10.0.64.0/18"]
}

variable "pvt_sub_names" {
  description = "Names of the private subnets"
  type        = list(string)
  default     = ["mysql-pvt-sub-01", "mysql-pvt-sub-02"]
}

variable "pvt_cidr" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.128.0/18", "10.0.192.0/18"]
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"  # Set the default region or use a different default
}

variable "bastion_instance_name" {
  description = "Name for the public EC2 instance (bastion)"
  type        = string
  default     = "bastion-instance"
}

variable "associate_public_ip_address" {
  description = "Associate a public IP address with the instance"
  type        = bool
  default     = true
}

variable "volume_size" {
  description = "Root volume size for the EC2 instances"
  type        = number
  default     = 29
}

variable "pvt_instance_name" {
  description = "Names for the private EC2 instances"
  type        = list(string)
  default     = ["mysql-master", "mysql-slave"]
}

variable "pvt_instance_name_02" {
  description = "Name of private EC2 instance"
  type        = string
  default     = "mysql"
}

variable "igw_name" {
  description = "Name of the Internet Gateway"
  type        = string
  default     = "mysql-igw"
}

variable "nat_name" {
  description = "Name of the NAT Gateway"
  type        = string
  default     = "mysql-nat"
}

variable "pub_rt_names" {
  description = "Name for the public route table"
  type        = string
  default     = "mysql-pub-rt-01"
}

variable "pvt_rt_names" {
  description = "Name for the private route table"
  type        = string
  default     = "mysql-pvt-rt-01"
}

variable "default_route_cidr_block" {
  description = "CIDR block for the default route (0.0.0.0/0)"
  type        = string
  default     = "0.0.0.0/0"
}

variable "local_gateway_id" {
  description = "ID of the local gateway for the local route"
  type        = string
  default     = "local"
}

variable "vpc_peering_cidr_block" {
  description = "CIDR block for the VPC peering route"
  type        = string
  default     = "172.31.0.0/16"
}

variable "peering_vpc_id" {
  description = "ID of the peering VPC"
  type        = string
  default     = "vpc-0a6b21e176f89012b"
}

variable "auto_accept_peering" {
  description = "Automatically accept the VPC peering connection"
  type        = bool
  default     = true
}

variable "vpc_peering_name" {
  description = "Name for the VPC peering connection"
  type        = string
  default     = "VPC-Peering"
}

variable "route_table_id" {
  description = "ID of the route table"
  type        = string
  default     = "rtb-03036867d4eb99638"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "inbound_ports" {
  description = "List of inbound ports and protocols"
  type        = list(map(any))  
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

variable "sec_grp" {
  description = "Name of the security group"
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


