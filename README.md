                              # Deploy WebServer in AWS Private Subnet using Terraform  

# Steps to Create AWS Infructure using terraform 
 1. Create VPC
 2. Create Subnets 
     a) Public Subnet 
     b) Private Subnet
 3. Create Internet Gatway
 4. Create Net Gatway(in Public Subnet)
 5. Create Route Table 
    a) Public Route
        a.1) Route table Association 
        a.2) Internet Gateway 
    b) Private Route 
        a.1) Route table Association 
        a.2) Net Gateway with Elastic IP
 6. Create Security Groups
    a) WEB Server Instance security_group
    b) Bastion Instance security_group
    c) Elastic Load Balancer security_group
 
 7. Create Bastion Host(Junp Host) Instance
 
 # WebServer Configuration
 
 8. Create Launch Configuration for webserver
 9. Create Auto Scalling group
 10. Create Load Balancer
 
 # Create Master Scrip as Userdata in Launch Configuration for webserver
 
 # Outputs
