# Definition Lean / Agile 
Roger stellt die User data für Grafana und DB Server berreit. 

Implemenatin User Data to ec2 über github -> Dany 
iAWS Account keine neuen User erstellen.

# Our Kanban Board Explained
In order to visualize and manage our workflow in agile project, we are going to use the kanban board directly in Github as our project management tool.
The aim is to have a clear and visual representation of the entire workflow, allowing us to easily see the status of all the tasks and help to improve the collaboration and communication. 
We choose a lean and simple kanban board design, where the following columns represent the different stages/process of the project.

•	Todo
•	In Progress
•	Done 
•	Backlog

When there is a new task or work item that needs to be completed, we first open a new "issue" in the ITCNE23-SEM-1 Github repository. 
In this "issue" we contain information about the task, such as its Title, assignees, label, milestone, priority, start date, end date and any notes or details related to the task.

We have defined four different labels that are used to indicate what type of category the kanban card is in.

•	documentation       - Improvements or additions to documentation 
•	iac                 - Infrastructure as Code 
•	monitoring          - POC Monitoring 
•	project             - Agile Project 

In order to ensure that the project is on track and to measure its progress, we have defined four milestones.

•	1.Sprint            - Project kickoff  
•	2.Sprint            - Implementing dependencies and first testing 
•	3.Sprint            - Finish prio A Tasks and joining the two project
•	4.Sprint            - Finish prio B Tasks, Work acceptance and Presentation

When the "issue" is opened, it automatically appears in the kanban board "Todo" column.
From there, we can then move the card to the "In Progress" column to show that we are actively working on it.
When the task has been completed, we can move the card to the "Done" column to indicate that it has been completed. You will also be able to add any additional notes or comments about the task or issues that arose.
The "Backlog" column can be seen as a holding area for tasks that are waiting to be added to the board or moved to the "To Do" column. It is a useful tool for planning future work and ensure for a steady flow of tasks moving through the workflow. 


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
    Use a version control system such as CodeCommit or GitHub to track changes to templates.


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

