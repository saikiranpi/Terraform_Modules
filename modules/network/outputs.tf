output vpc_name {
  value       = var.vpc_name
}

output vpc_id {
  value       = aws_vpc.default.id
}

output environment {
  value       = var.environment
}

output public_subnets_id {
  value       = "${aws_subnet.public-subnets.*.id}"
}

output private_subnets_id {
  value       = "${aws_subnet.private-subnets.*.id}"
}

output public_subnets_id_1 {
  value       = "${aws_subnet.public-subnets.0.id}"
}

