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

  dynamic "ingress" { # Here the block name is ingress. Terraform generally give u a keyword with block name. you can use it to iterate blocks
    for_each = var.ingress_ports
    content{
    from_port   = ingress.value["from_port"]
    to_port     = ingress.value["to_port"]
    protocol    = ingress.value["protocol"]
    cidr_blocks = ingress.value["cidr_blocks"]
  }
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