resource "aws_instance" "expense" {
  for_each = var.instance_types # Terraform will give us a variable called each
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = each.value
  vpc_security_group_ids = [aws_security_group.allow-tcp.id]

  tags = {
    Name = each.key
  }
}

resource "aws_security_group" "allow-tcp" {
  name        = "allow-ssh"
  description = "Allow ssh inbound traffic and all outbound"
  # you can give vpc_id if you want, otherwise it will take default vpc

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow-ssh-inbound all outbound"
  }
}

# output "ec2_info" {
#   value = aws_instance.expense
# }