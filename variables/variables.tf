variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "This is our RHEL9 AMI ID"
}

variable "instance_type" {
  type    = string
#   default = "t2.micro"
}

variable "ec2_tags" {
  type = map(string) # This is optional, you can also directly give map
  default = {
    project     = "expense"
    component   = "backend"
    environment = "dev"
    Name        = "expense-backend-dev"
  }

}
variable "ingress_from_port" {
  type    = number
  default = 22
}

variable "ingress_to_port" {
  type    = number
  default = 22
}

variable "egress_from_port" {
  type    = number
  default = 0
}

variable "egress_to_port" {
  type    = number
  default = 0
}

variable "cidr_blocks" {
  type    = list(string) # Same here, (string) is optional
  default = ["0.0.0.0/0"]
}

variable "security_group_tags" {
  type = map(any)
  default = {
    Name = "expense-backend-dev"
  }
}