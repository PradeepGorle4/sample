variable "instance_type" {
    type = string
    default = "t2.micro" # This can be overriden by locals.tf
}

# Disadvantage of variables is that you cannot call variables inside a variable, thats where locals.tf comes in. you can check that file for eg

variable "project" {
  default = "expense"
}

variable "component" {
  default = "backend"
}

variable "environment" {
  default = "dev"
}

# I want the server name tag to be like project-component-environment, with variables it is not possible, so use locals