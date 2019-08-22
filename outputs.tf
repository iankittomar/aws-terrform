output "aws-instance" {
  value = aws_instance.bastion.id
}

output "this_elb_instances" {
  description = "The list of instances in the ELB"
  value       = flatten(aws_elb.web_elb.*.instances)
}
output "nat_public_ips" {
  description = "Elastic IPs created for AWS NAT Gateway"
  value       = aws_eip.nat.*.public_ip
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = concat(aws_vpc.default.*.id, [""])[0]
}

output "public_subnet" {
  description = "List of IDs of public subnets"
  value       = aws_subnet.public.*.id
}

output "private_subnet" {
  description = "List of IDs of private subnets"
  value       = aws_subnet.private.*.id
}

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = concat(aws_internet_gateway.gw.*.id, [""])[0]
}

output "nat_ids" {
  description = "List of allocation ID of Elastic IPs created for AWS NAT Gateway"
  value       = aws_eip.nat.*.id
}
output "mount_target_dns_names" {
  value       = [coalescelist(aws_efs_mount_target.efs.*.dns_name, [""])]
  description = "List of EFS mount target DNS names"
}
output "mount_target_ids" {
  value = "${join(",", aws_efs_mount_target.efs.*.id)}"
}

output "mount_target_interface_ids" {
  value = "${join(",", aws_efs_mount_target.efs.*.network_interface_id)}"
}
