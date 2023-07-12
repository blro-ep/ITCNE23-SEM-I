ITCNE23-SEM-I
==== 

TBZ Semsterarbeit Dany / Roger

## Table of Content

* 01 - [Introduction](#01-Introduction)
* 02 - [Project](#02-Project-Management)
* 03 - [Infrastructure as Code](#03-Infrastructure-as-Code)
* 04 - [Monitoring](#04-Monitoring)
* 05 - [Conclusion](#05-Conclusion)

## 01 Introduction

In this semester work, I want to deploy a highly available 3-tier infrastructure as code using AWS CloudFormation. 
In collaboration, with Roger Blum, we will integrate Roger’s monitoring solution into my AWS infrastructure. 

## 02 Project Management

In order to visualize and manage our workflow in agile project, we are going to use the kanban board directly in Github as our project management tool.

- [**Project Documentation**](project/README.md)

## 03 Infrastructure as Code

The project is about gain hands-on experience with YAML scripting creating an AWS CloudFormation template to automate a small environment with a Variety of AWS services such as Amazon EC2 instances, Amazon RDS instances, Amazon S3 buckets, and Amazon CloudFront distributions, while following the best practices outlined in the AWS Well-Architected Framework.

> By providing an accessible platform, this project will enable individuals to gain valuable experience in CloudFormation scripting, as well as an understanding of the fundamentals and possibility's of CloudFormation. 

This project aims to demonstrate multiple approaches for connecting different CloudFormation scripts together and the implementation will be extensively explained and commented on to make each step easy to understand.

- [**Infrastructure as Code Documentation**](aws-iac/README.md)

## 04 Monitoring

Grafana is a multi-platform open source analytics and interactive visualization web application. 
It provides charts, graphs, and alerts for the web when connected to supported data sources. 

In this project, we use Prometheus as data source, it is an open-source systems monitoring and alerting toolkit. Prometheus collects data in the form of time series.

> The monitoring components can be easily operated as a container using Podman. These are official Docker images.

- [**Monitoring Documentation**](monitoring/README.md)

## 05 Conclusion

The project tools provided by Github (Projects / Board / Roadmap / Task) surprised us positively. These board resources made it very easy for everyone involved to keep track of everything and keep the schedule under control. 
The work is traceable and could be tracked through the git-commits. It was fun to work with Github.

It was very exciting and instructive to see what can be deployed automatically using AWS CloudFormation and how monitoring is integrated using Cloud-init. 
The work clearly illustrated the advantages of the cloud and showed the great potential.

Inputs from the lessons have been continuously incorporated into the work and have led to constant optimisations.

- [**Conclusion IaC**](aws-iac/README.md#06-conclusion)
- [**Conclusion Monitoring**](monitoring/README.md#8-conclusion)