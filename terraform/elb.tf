resource "aws_elb" "cocalc" {
  name               = "cocalc-elb"
  availability_zones = ["${var.az}"]

  listener {
    instance_port      = 443
    instance_protocol  = "https"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "${var.certificate_id}"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTPS:443/"
    interval            = 30
  }

  instances                   = ["${aws_instance.cocalc.id}"]
  connection_draining         = true
  connection_draining_timeout = 600

  tags {
    Name = "cocalc"
  }
}
