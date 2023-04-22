# Definition Lean / Agile 
Roger stellt die User data für Grafana und DB Server berreit. 

Implemenatin User Data to ec2 über github -> Dany 
iAWS Account keine neuen User erstellen.

# Kanban board erklärt 
Workflow Management

Neuer auftrag geht in to do und wird katagorisiert 

Lables erklären

# Communication 
-> Teams MS
Seperater Channel 

# SMART Ziele Definieren 

## collaboration
Use a Git repository to make project collaboration as agile and lean as possible. Define clear system boundaries.

Port Matrix 
Layout iac kommunizieren
User Data bereitgestellt ber Github

## iac
The project is about gain hands-on experience with YAML scripting creating an AWS CloudFormation template to automate a small environment with a Variety of AWS services such as 
Amazon EC2 instances, Amazon RDS instances, Amazon S3 buckets, and Amazon CloudFront distributions, while following the best practices outlined in the AWS Well-Architected Framework.

By providing an accessible platform, this project will enable individuals to gain valuable experience in CloudFormation scripting, as well as an understanding of the fundamentals and possibilitys of CloudFormation.
This project aims to demonstrate multiple approaches for connecting different CloudFormation scripts together and the implementation will be extensively explained and commented on to make each step easy to understand. 

•	Automate Infrastructure Provisionen with Cloudformation.
•	Deploy a highly available architecture with a reliable 3-tier infrastructure that spans two availability zones.
•   Managed network address translation (NAT) gateways to allow outbound internet access for resources in the private subnets.
•   Dedicated custom network access control lists (ACLs) for each Availability Zone.
•   A single routing table for the public subnet, because the public subnets all use the same Internet gateway as the only route to communicate with the Internet.
•   Dedicated custom network ACLs for each Availability Zone
•   An independent routing table for each private subnet configured to control the flow of traffic within and outside the VPC.
•   Spare capacity for adding subnets to support your environment as it grows.
•   a VPC gateway endpoint for Amazon Simple Storage Service (Amazon S3). This endpoint provides a secure, reliable connection to Amazon S3
•   A layered architecture organizes stacks into multiple horizontal layers that build on top of one another. 
•	Include various basic AWS infrastructure services such as SSM / Endpoints / NAT Gateway / Security Groups / NACL / Flow Log / EFS / EC2 / Load Balancer / S3 Bucket
•	Built according to AWS best practices and the AWS Well-Architected Framework.
•	Build flexible CloudFormation templates with detailed code comments and a cheat sheet to explain the CloudFormation code used.
•	Integrate Roger's monitoring solution into my AWS infrastructure and provision various services for monitoring.


## monitoring 

# Seusag Systemabgrenzung
Was deployed Dany was kommt von Roger 
Roger liefert User Data information über github pull und sagt wie viel server er wo braucht mit welchen verbindungen 
Ich öffne die enstprechenden verbindungen und intigriere die server mit userdata in mein Iac Script 

## iac Seusag

## Monitoring Seusag 

## Zusammengefügtes seusag



# dependencies

## Monitoring
User Data wird von Github pull gemacht

## Target
Proetheus Tarets apt installieren 
Private IP Adresse Komunnizieren



# milestones 
Sind in Github definiert

## 15.5 1.Sprint
Project kick off abgeschlossen
Individuelle Tasks angefangen iac und monitoring

## 14.6 2. Sprint 
Schnittstellen klar definiert und implementieren
Integration test iac - monitoring 

## 05.7 3. Sprint
Aschliessendes zusammenfügen und ausfürhliches Testing
Prio A Tasks abgeschlossen 
Fazit erstellen 

## 12.7 4. Sprint 
Abnahme der Arbeit 
Präsentation 

