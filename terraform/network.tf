resource "aws_vpc" "cocalc" {
  cidr_block = "10.200.0.0/16"

  tags = {
    Name = "cocalc"
  }
}

resource "aws_subnet" "cocalc_subnet" {
  vpc_id = "${aws_vpc.cocalc.id}"

  cidr_block = "10.200.1.0/24"

  tags {
    Name = "cocalc"
  }
}
