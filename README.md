AWS deployment automation
=========================

Written so specs could be written out in Excel for exec types to be able to work with and then easily exported to CSV and run by this program to build the VPC / EC2 instances, RDS, security groups, IAM, S3, etc.

1.  Create a CSV with deployment settings (see vpc-configuration.csv)
2.  Run command below:

usage: ./deploy.rb [environment] [location] [tenant_id] [csv]

 environments: production preprod
 locations: usw1 euw1 aps1 ap2 use1
 tenant_id: 070 080 100
 csv tenant.csv (saved as csv from excel)
 
 
See config.rb where you can define VPC, AMIs to use, etc for each arbitrary region.  

Instance and RDS deployments are cleanly done, security group, IAM, and s3 work, but the code is not nimble.

[my link](LINK.md)
