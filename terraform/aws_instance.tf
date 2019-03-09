resource "aws_key_pair" "cocalc" {
  key_name   = "cocalc"
  public_key = "${file("keys/id_rsa.pub")}"
}

resource "aws_instance" "cocalc" {
  count                       = 1
  ami                         = "${var.ami_id}"
  instance_type               = "t2.micro"
  subnet_id                   = "${aws_subnet.cocalc_subnet.id}"
  key_name                    = "cocalc"
  associate_public_ip_address = true

  tags = {
    Name = "cocalc"
  }
}
