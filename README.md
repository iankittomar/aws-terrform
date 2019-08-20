# Deploy WebServer in AWS Private Subnet using Terraform  

## Steps to Create AWS Infructure using terraform 
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
 
 ## WebServer Configuration
 
 8. Create Launch Configuration for webserver
 9. Create Auto Scalling group
 10. Create Load Balancer
 
 ## Create Master Scrip as Userdata in Launch Configuration for webserver
 
 ## Deploy your Terraform scrip By using Command
  ### terraform plan
  ### terraform apply

![ws1 1](https://user-images.githubusercontent.com/34299541/63341177-f3fcbf80-c348-11e9-92d6-83510c43cc06.png)

 ## Outputs of Terraform 

![ws2](https://user-images.githubusercontent.com/34299541/63341199-fced9100-c348-11e9-89ca-bb0fbbd09aa7.png)

## Use Bastion Host Instance to SSH in Private Subnet 

### Internet Access and WebServer in Private Subnet 

![ws1](https://user-images.githubusercontent.com/34299541/63341221-07a82600-c349-11e9-82af-cae3e8e2c67d.png)
