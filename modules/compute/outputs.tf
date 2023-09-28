output private_servers {
  value       = "${aws_instance.private-servers.*.id}"
}
output public_servers {
  value       = "${aws_instance.public-servers.*.id}"
}