resource "aws_instance" "bastion" {
  ami                         = "ami-06358f49b5839867c"
  availability_zone           = "eu-west-1a"
  instance_type               = "t2.micro"
  key_name                    = "mn-aws-uks-1"
  security_groups             = ["${aws_security_group.bastion.id}"]
  subnet_id                   = "${aws_subnet.public.id}"
  associate_public_ip_address = true
  source_dest_check           = false
  #user_data = "${file("master.sh")}"
  depends_on = [
    "aws_security_group.bastion"
  ]
  #user_data = "${file("master.sh")}"

  tags = {
    Name = "bastion"
  }
}

resource "aws_eip" "bastion_eip" {
  instance = "${aws_instance.bastion.id}"
  vpc      = true
}


## Creating Launch Configuration
resource "aws_launch_configuration" "webserver" {
  image_id        = "${var.amis}"
  instance_type   = "${var.instance_type}"
  security_groups = ["${aws_security_group.webserver.id}"]
  key_name        = "mn-aws-uks-1"
  user_data       = "${file("master.sh")}"
  #associate_public_ip_address = true
  lifecycle {
    create_before_destroy = true
  }
}

/*
Auto Scalling group for WebServer
*/

resource "aws_autoscaling_group" "webserver-asg" {
  launch_configuration = "${aws_launch_configuration.webserver.id}"

  min_size         = 1
  desired_capacity = 2
  max_size         = 2

  health_check_type = "EC2"
  load_balancers    = ["${aws_elb.web_elb.id}"]
  tag {
    key                 = "Name"
    value               = "terraform-WebServers"
    propagate_at_launch = true
  }
  vpc_zone_identifier = [
    "${aws_subnet.private.id}"
  ]
  lifecycle {
    create_before_destroy = true
  }
}

/*
Load Balancer for WebServer
*/

resource "aws_elb" "web_elb" {
  name = "web-elb"
  security_groups = [
    "${aws_security_group.elb_http.id}"
  ]
  subnets                   = ["${aws_subnet.public.id}"]
  cross_zone_load_balancing = true
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTP:80/"
  }
  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = "80"
    instance_protocol = "http"
  }
}



