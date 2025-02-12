locals { # It gives the result of the expression and stores it in a variable, ami_id in this case
  ami_id = data.aws_ami.joindevops.id # we cannot store this expression output in variables, so local is the best option
  instance_type = "t2.micro" # If we write in local,it cannot be overwritten. so it provides security
}

locals {
  name = "${var.project}-${var.environment}-${var.component}"
}