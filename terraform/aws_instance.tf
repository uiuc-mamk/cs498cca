resource "aws_key_pair" "cocalc" {
  key_name   = "cocalc"
  public_key = "${file("keys/id_rsa.pub")}"
}

resource "aws_instance" "cocalc" {
  count                       = 1
  ami                         = "${var.ami_id}"
  instance_type               = "t3.medium"
  key_name                    = "cocalc"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.cocalc.id}"]
  availability_zone           = "${var.az}"

  root_block_device {
    delete_on_termination = true
    volume_size           = 20
  }

  tags {
    Name = "cocalc"
  }
}
