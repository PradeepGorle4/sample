resource "aws_instance" "nginx_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow-tcp.id]

  tags = var.ec2_tags
}

resource "aws_security_group" "allow-tcp" {
  name        = "allow-ssh"
  description = "Allow ssh inbound traffic and all outbound"
  # you can give vpc_id if you want, otherwise it will take default vpc

  ingress {
    from_port   = var.ingress_from_port
    to_port     = var.ingress_to_port
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = "-1"
    cidr_blocks = var.cidr_blocks
  }

  tags = var.security_group_tags
}
