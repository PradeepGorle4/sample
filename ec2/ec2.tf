resource "aws_instance" "nginx_server" {
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow-tcp.id]

  tags = {
    Name = "Terraform-instance"
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