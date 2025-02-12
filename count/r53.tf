resource "aws_route53_record" "expense" {
    count = length(var.instances) # This is a function -length()
  # count = 3
    zone_id = var.zone_id
    name    = "${var.instances[count.index]}.${var.domain_name}" # This is called interpolation
    type    = "A"
    ttl     = 1
    records = [aws_instance.expense[count.index].private_ip] # This is list datatype
    allow_overwrite = true
}

resource "aws_route53_record" "frontend" { # I gave this as frontend instead of expense because terraform wont accept duplicate resource names
    zone_id = var.zone_id
    name    = var.domain_name # This is called interpolation
    type    = "A"
    ttl     = 1
    records = [aws_instance.expense[2].public_ip] # This is list datatype
    allow_overwrite = true
}