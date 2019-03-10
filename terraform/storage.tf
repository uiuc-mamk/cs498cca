resource "aws_ebs_volume" "cocalc-data" {
  size = 100

  availability_zone = "us-east-1d"

  tags = {
    Name = "cocalc"
  }
}

resource "aws_volume_attachment" "colcalc-data-attachment" {
  device_name = "/dev/xvdf"
  volume_id   = "${aws_ebs_volume.cocalc-data.id}"
  instance_id = "${aws_instance.cocalc.id}"
}
