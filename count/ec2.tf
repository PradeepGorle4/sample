resource "aws_instance" "expense" {
  count = length(var.instances) # This is a function -length()
  # count = 3
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow-tcp.id]

  # tags = {
  #   Name = var.instances[count.index]
  # }
  tags = merge(   # We are mergint the common tags along with the Name tag
    var.common_tags,
    {
      Name = var.instances[count.index]
    }
  )

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