output "cocalc_public_ip" {
  value = "${aws_instance.cocalc.public_ip}"
}
