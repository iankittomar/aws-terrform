resource "aws_efs_file_system" "efs" {
  creation_token   = "efs-testing"
  performance_mode = "${var.performance_mode}"
  encrypted        = "true"

  tags {
    Name        = "efs"
    Terraform   = "true"
  }
}

resource "aws_efs_mount_target" "efs" {
  count           = "${length(var.subnets)}"
  file_system_id  = "${aws_efs_file_system.efs.id}"
  subnet_id       = "${aws_subnet.public.id}"
  security_groups = ["${aws_security_group.efs.id}"]
}
