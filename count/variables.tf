variable "instances" {
    type = list
    default = ["mysql", "backend", "frontend"]
}

variable "zone_id" {
    type = string
    default = "Z025468528XQ0B4FE5YQ9"
}

variable "domain_name" {
    type = string
    default = "pradeepdevops.online" 
}

variable "common_tags" {
    type = map
    default = {
        project = "expense"
        environment = "dev"
    }
}