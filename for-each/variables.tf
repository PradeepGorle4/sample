variable "instance_types" {
    type = map
    default = {
        mysql = "t3.micro"
        backend = "t2.micro"
        frontend = "t2.micro"
    }

}

variable "zone_id" {
    type = string
    default = "Z025468528XQ0B4FE5YQ9"
}

variable "domain_name" {
    type = string
    default = "pradeepdevops.online"
}