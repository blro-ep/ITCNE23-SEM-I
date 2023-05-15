Definition Lean / Agile Project
==== 

Roger stellt die User data für Grafana und DB Server berreit. 

Implemenatin User Data to ec2 über github -> Dany 

## Table of Content

* 01 - [Our Kanban Board Explained](#01-Our-Kanban-Board-Explained)
* 02 - [Communication](#02-Communication)
* 03 - [SMART Objectives](#03-SMART-Objectives)
* 04 - [Seusag](#04-Seusag)
* 05 - [Merge ](#05-Merge)
* 06 - [Dependencies](#06-Dependencies)


## 01 Our Kanban Board Explained
In order to visualize and manage our workflow in agile project, we are going to use the kanban board directly in Github as our project management tool.
The aim is to have a clear and visual representation of the entire workflow, allowing us to easily see the status of all the tasks and help to improve the collaboration and communication. 

We choose a lean and simple kanban board design, where the following columns represent the different stages/process of the project.

```
- Todo
- In Progress
- Done 
- Backlog
```

![Kanbandboard](images/kanbanboard.png)

When there is a new task or work item that needs to be completed, we first open a new "issue" in the ITCNE23-SEM-1 Github repository. 

In this "issue" we contain information about the task, such as its Title, assignees, label, milestone, priority, start date, end date and any notes or details related to the task.

![issue](images/kanbanissue.png)

We have defined four different labels that are used to indicate what type of category the kanban card is in.

```
- documentation       - Improvements or additions to documentation 
- iac                 - Infrastructure as Code 
- monitoring          - POC Monitoring 
- project             - Agile Project 
```

In order to ensure that the project is on track and to measure its progress, we have defined four milestones.

```
- 1.Sprint            - Project kickoff finished, Individual tasks started iac and monitoring 
- 2.Sprint            - Definition and implementation of the dependencies and first testings iac - monitoring 
- 3.Sprint            - Finish prio A tasks, join the two project and extensive testing
- 4.Sprint            - Conclusion, Work acceptance and Presentation
```

When the "issue" is opened, it automatically appears in the kanban board "Todo" column.

From there, we can then move the card to the "In Progress" column to show that we are actively working on it.

When the task has been completed, we can move the card to the "Done" column to indicate that it has been completed. You will also be able to add any additional notes or comments about the task or issues that arose.

The "Backlog" column can be seen as a holding area for tasks that are waiting to be added to the board or moved to the "To Do" column. It is a useful tool for planning future work and ensure for a steady flow of tasks moving through the workflow. 


## 02 Communication 

![MSTeams](images/msteams_logo.png)

In order to ensure total transparency for the auditors, the project communication will be carried out via a dedicated teams channel "ITCNE23-SEM-I communication".

Allows the sharing of updates and discussion of project related issues in a centralised and organised manner for effective communication between us.


## 03 SMART Objectives

### 03.1 Collaboration
Use a Git repository to make project collaboration as agile and lean as possible. Define clear system boundaries.

Port Matrix 
Layout iac kommunizieren
User Data bereitgestellt ber Github

###  IaC Infrastructure as Code

![yamliac](images/yaml_logo.png)

The project is about gain hands-on experience with YAML scripting creating an AWS CloudFormation template to automate a small environment with a Variety of AWS services such as 
Amazon EC2 instances, Amazon RDS instances, Amazon S3 buckets, and Amazon CloudFront distributions, while following the best practices outlined in the AWS Well-Architected Framework.

> By providing an accessible platform, this project will enable individuals to gain valuable experience in CloudFormation scripting, as well as an understanding of the fundamentals and possibilitys of CloudFormation.
> This project aims to demonstrate multiple approaches for connecting different CloudFormation scripts together and the implementation will be extensively explained and commented on to make each step easy to understand. 

```
- Automate Infrastructure Provisionen with Cloudformation.
- Deploy a highly available architecture with a reliable 3-tier infrastructure that spans two availability zones.
- Managed network address translation (NAT) gateways to allow outbound internet access for resources in the private subnets.
- Dedicated custom network access control lists (ACLs) for each Availability Zone.
- A single routing table for the public subnet, because the public subnets all use the same Internet gateway as the only route to communicate with the Internet.
- Dedicated custom network ACLs for each Availability Zone
- An independent routing table for each private subnet configured to control the flow of traffic within and outside the VPC.
- Spare capacity for adding subnets to support your environment as it grows.
- a VPC gateway endpoint for Amazon Simple Storage Service (Amazon S3). This endpoint provides a secure, reliable connection to Amazon S3
- A layered architecture organizes stacks into multiple horizontal layers that build on top of one another. 
- Include various basic AWS infrastructure services such as SSM / Endpoints / NAT Gateway / Security Groups / NACL / Flow Log / EFS / EC2 / Load Balancer / S3 Bucket
- Built according to AWS best practices and the AWS Well-Architected Framework.
- Build flexible CloudFormation templates with detailed code comments and a cheat sheet to explain the CloudFormation code used.
- Integrate Roger's monitoring solution into my AWS infrastructure and provision various services for monitoring.
- Use a version control system such as CodeCommit or GitHub to track changes to templates.
```

###  Monitoring

![grafana](images/grafana_logo.png)

## 04 Seusag
Was deployed Dany was kommt von Roger 
Roger liefert User Data information über github pull und sagt wie viel server er wo braucht mit welchen verbindungen 
Ich öffne die enstprechenden verbindungen und intigriere die server mit userdata in mein Iac Script 

### iac Seusag

### Monitoring Seusag 

### Zusammengefügtes seusag


## 05 Dependencies

### Monitoring
User Data wird von Github pull gemacht

### Target
Proetheus Tarets apt installieren 
Private IP Adresse Komunnizieren