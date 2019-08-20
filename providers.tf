# Configure the AWS Provider
provider "aws" {
  version    = "~> 2.17"
  region     = "${var.aws_region}"
  access_key = "${var.aws_access}"
  secret_key = "${var.aws_secret}"
}
