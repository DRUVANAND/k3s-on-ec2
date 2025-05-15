variable "instance_type" {
  description = "EC2 instance type to launch"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the EC2 key pair to use"
  type        = string
}

variable "ami" {
  description = "AMI ID of the EC2 instance (e.g., Ubuntu 22.04)"
  type        = string
}

variable "public_key_path" {
  description = "Local path to your SSH public key file"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "Optional list of existing VPC security group IDs"
  type        = list(string)
  default     = []
}
