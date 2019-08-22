#!/bin/bash

sudo apt-get update
sudo apt-get install nginx -y
sudo apt-get install nfs-common
sudo mkdir -p /mnt/efs #create a directory to mount our efs volume to
sudo mount -t nfs4 -o nfsvers=4.1 ${aws_efs_mount_target.efs.dns_name}:/ /mnt/efs  
sudo su -c \"echo '${aws_efs_mount_target.efs.dns_name}:/ /mnt/efs nfs4 defaults 0 0' >> /etc/fstab\"   #create fstab entry to ensure automount on reboots
sudo mount -a
