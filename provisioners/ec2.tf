resource "aws_instance" "nginx_server" {
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow-tcp.id]

  tags = {
    Name = "Terraform-instance"
  }

   provisioner "local-exec" {
    command = "echo ${self.private_ip} > inventory"
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [ 
      "sudo dnf install nginx -y",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx"
     ]
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [ 
      "sudo systemctl stop nginx"
     ]
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

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
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