AWS Infrastructure as Code
==== 

TBZ Semster Arbeit Dany / Roger

## Table of Content

* 01 - [Introduction IAC](#01-Introduction-IAC)
* 02 - [AWS CloudFormation Cheat Sheet](#02-AWS-CloudFormation-Cheat-Sheet)
* 03 - [Project Overview](#04-Project-Overview)
* 04 - [How to Deploy](#03-How-to-Deploy)
* 05 - [AWS Well Architected Framework ](#03-AWS-Well-Architected-Framework)
* 05 - [Conclusion](#05-Conclusion)

## 01 Introduction IAC

**What is IaC?**

> mature technology used by DevOps teams to automate resource provisioning on the cloud

**What is**![AWS CloudFormation](images/cloudformation_logo.png)
 
> Amazon provides its own IaC platform called CloudFormation, it provisions and configures resources based on a template you create, which specifies the resources you require (such as EC2 instances or RDS DB instances, ...)

**What format is the code in?**

> The template you use in CloudFormation template will be a text file in JSON or YAML format 

**What is the project's main mission?**

> The project is about gain hands-on experience with YAML scripting creating an AWS CloudFormation template to automate a small environment with a Variety of AWS services such as
- EC2 instances
- Subnets
- NACL
- NAT Gateways
- Load Balancer
- RouteTables
- Endpoints
- Security Groups
- Roles
- Flow Logs
- S3 buckets 

> while following the best practices outlined in the AWS Well-Architected Framework.

**What is the secondary mission of the project?**


> By providing an accessible platform, this project will enable individuals to gain valuable experience in CloudFormation scripting, as well as an understanding of > the fundamentals and possibility's of CloudFormation.

> This project aims to demonstrate multiple approaches for connecting different CloudFormation scripts together and the implementation will be extensively explained > and commented on to make each step easy to understand. 


## 02 AWS CloudFormation Cheat Sheet

This AWS CloudFormation Cheat Sheet is a quick, self-made reference guide that will provide you with a complete list of all the features that are used in my script.

- [**Full Cheat Sheet**](Cheat_Sheet_Cloud_Formation.md)

![Short Table Version](images/cheat_logo.png)  

- [**Short Cheat Sheet PDF**](cheatsheet_aws-cloudformation.pdf)

For keeping the scop of this project reasonable, the guide is described just in YAML and with man practical examples from the Template, it's designed to help you to understand the fundamentals and the possibility's of CloudFormation.
## 03 Project Overview 

Here is an overview of the AWS infrastructure that will be deployed for the project

![Drawio](images/AWSInfra01.png)

## 04 How to Deploy 

Here i will describe how the Template can be deployed via AWS CLI 
 
![DeployCLI](images/deploy.png)  



- [**How to Deploy via CLI**](howtodeploy.md)

## 05 AWS Well Architected Framework 

By using the Framework you will learn architectural best practices for designing and operating reliable, secure, efficient, cost-effective, and sustainable systems in the cloud.

> The AWS Well-Architected Framework describes key concepts, design principles, and architectural best practices for designing and running workloads in the cloud.

- [**AWS Well Architected Framework**](best_practice.md)



## 05 Conclusion

> Comming Soon




