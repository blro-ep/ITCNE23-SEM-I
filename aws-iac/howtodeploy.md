AWS how to deploy
==== 

## Table of Content

* 01 - [AWS CLI Access ](#01-AWS-CLI-Access)
* 02 - [Prerequisite](#02-Prerequisite)
* 03 - [Deployment](#03-Deployment)
* 04 - [Stack Information](#04-Stack-Information)
* 05 - [Update stack ](#05-Update-stack)
* 06 - [Delete stack](#05-Delete-stack)


## 01 AWS CLI Access

1. Go To the AWS Console 
2. Open IAM and in the Dashboard Open "My security credentials" 
3. "Create access key" approve and click "Create access key"  again 
4. download your "Access key" and your "Secret access key"

![Access key](accesskey.png)  

5. Install the latest AWS CLI

```
Windows: https://aws.amazon.com/cli/
Linux: sudo apt install awscli
```

6. Open a Console and confiuate your newest CLI Profile like follow:

```
$ aws configure --profile Swisscom
AWS Access Key ID [None]: ASIA5RV7WLQ6W6AJUFWH
AWS Secret Access Key [None]: /qCS6sU0fYzmG1L8R1mK07nbIVblqh437HVV
Default region name [None]: eu-central-2
Default output format [None]: yaml
```

### Anzeigen aller Profile

```
aws configure list-profiles
```
----

## 02 Prerequisite

### IAM CloudFormation user (best Pracitce)

Setting up an IAM user for CloudFormation is best Practice to improve security, access control and accountability for your AWS resources. 

> It is a part of AWS Well Architect Framwork for using CloudFormation and allows you to track and audit actions performed, while allowing you to fine-grained access control based on roles, groups and policy.


1. We’ll start by creating a iam user

```
aws iam create-user --user-name cloudformation-user --profile gmail
```

2. create an access key

```
aws iam create-access-key --user-name cloudformation-user --profile gmail
```

3. Use the response of the access key create to configure a new profile:

```
aws configure --profile cloudformation-user
```

![CLI Profile](cli-profile.png)  

4. Attaching the Inline Policy to the newly created cloudformation-user (cloudformation-user-policy.txt)

This policy allows the cloudformation-user to create, describe, update, and delete CloudFormation stacks, and pass associated IAM roles, with no resource restrictions.
   
```
aws iam put-user-policy \
    --user-name cloudformation-user \
    --policy-name cloudformation-user-policy \
    --policy-document file://cloudformation-user-policy.txt \
    --profile gmail
```

5. Create a new role and pass the trust policy file that allows the user to assume the role (assume-role.txt)

To not allow the cloudformation-user directly to create and delete new S3 Buckets we will now create a new role and allow the cloudformation.amazonaws.com Service to assume this role.
This document is saying that the cloudformation.amazonaws.com service can assume the role to which this policy is attached to.

```
aws iam create-role \
    --role-name cloudformation-role \
    --assume-role-policy-document file://assume-role.txt \
    --profile gmail
```

6.  Now we need to attach a policy to the new role to specify what it is allowed to do (cloudformation-role-policy.txt)

Here we will attach the newly created role a policy to allow it to CreateBucket and DeleteBucket s3 Buckets

```
aws iam put-role-policy \
    --role-name cloudformation-role \
    --policy-name cloudformation-policy \
    --policy-document file://cloudformation-role-policy.txt \    !! Achtung HIER WIRD Neu einfach AdministratorAccess gegeben !!
    --profile gmail
```

7. Get the cloudformation-user Arn and copy it to the clipboard

```
aws iam get-role --role-name cloudformation-role --profile gmail
```

Example
```
arn:aws:iam::824877243403:role/cloudformation-role
```


### CLI S3 Bucket erstellen 

1. You need a S3 Bucket to upload your CloudFormation Templates to
   
```
$ aws s3api create-bucket \
    --bucket devdeploysemzh \
    --region eu-central-2 \
    --create-bucket-configuration LocationConstraint=eu-central-2 \
    --profile gmail 
```

### Test funktionalität s3 Bucket Listing:
aws s3 ls --profile Swisscom

### Cloud Formation Package erstellen:

1. To make the deployment of our Template more convenient, we can use the Cloud Formation Package CLI commend

> This allows the CloudFormation template to be deployed without having to manually upload the different yaml code files to S3 separately. 
```
$ aws cloudformation package \
    --template-file cloudformation_VPC.yaml \
    --output-template packaged.yaml \
    --s3-bucket devdeploysemzh \
    --profile cloudformation-user
```

1. Now we have a new output to packaged.yaml that reflects a new "packaged" template with all necessary assets uploaded to your deployment s3 bucket and the nasted URL Changed.

----

## 03 Deployment

# Stack deploy --capabilities CAPABILITY_IAM -disable-rollback ohne NAT Gateway      --capabilities CAPABILITY_NAMED_IAM \ - stack contains IAM resources with custom names

--parameter-overrides file://parameter.json  \
```
aws cloudformation deploy \
    --template-file packaged.yaml \
    --stack-name VPC-DEV01 \
    --capabilities CAPABILITY_IAM \
    --capabilities CAPABILITY_NAMED_IAM \
    --role-arn arn:aws:iam::824877243403:role/cloudformation-role \
    --profile cloudformation-user
```
GMAIL VERSION NO ROLE
```
aws cloudformation deploy \
    --template-file packaged.yaml \
    --stack-name VPC-DEV01 \
    --capabilities CAPABILITY_IAM \
    --capabilities CAPABILITY_NAMED_IAM \
    --disable-rollback \
    --parameter-overrides file://parameter.json \
    --profile gmail
```


aws cloudformation describe-change-set --changeset-name VPC-DEV01

# Validate Monitoring  Template
```
aws cloudformation validate-template --template-body file://templates/monitoring.yaml --profile gmail
```

# MONITORING Stack deploy --parameter-override file:

```
# Stack erstellen --capabilities CAPABILITY_IAM 
aws cloudformation create-stack \
    --stack-name MonitoringStack \
    --template-body file://templates/monitoring.yaml \
    --role-arn arn:aws:iam::824877243403:role/cloudformation-role \
    --disable-rollback \
    --profile cloudformation-user
```

```
# Stack erstellen --capabilities CAPABILITY_IAM 
aws cloudformation create-stack \
    --stack-name MonitoringStack \
    --template-body file://templates/monitoring.yaml \
    --role-arn arn:aws:iam::824877243403:role/cloudformation-role \
    --profile cloudformation-user
```


## 04 Stack Information

Describe stack creation 

```
aws cloudformation describe-stacks --stack-name VPC-DEV01 --profile cloudformation-user
```

look at the individual events that happened to the stack
```
aws cloudformation describe-stack-events --stack-name VPC-DEV01 --profile cloudformation-user
```

```
aws cloudformation wait stack-create-complete \
    --stack-name cloudformation-workshop-dev-security-groups \
    --region us-east-1
```

## 05 Update stack 

aws cloudformation update-stack --stack-name VPC-DEV01 --template-body file://cloudformation_VPC_2.yaml --capabilities CAPABILITY_IAM --parameters ParameterKey=EnvironmentName,ParameterValue=VPC-DEV01 --disable-rollback --profile Swisscom


## 06 Delete stack

Stack löschen  mit --retain-resources option 

```
aws cloudformation delete-stack --stack-name VPC-DEV01 --retain-resources --profile cloudformation-user
```

--------------
# ÜBRIGES 

# config File auf S3 Laden 
aws s3 cp simpleec2.yaml s3://config-bucket-931336182845 --profile Swisscom
aws s3 cp simpleec3.yaml s3://config-bucket-931336182845 --profile Swisscom

# Template Validation durchführen
aws cloudformation validate-template --template-body file://cloudformation_VPC_3.yaml --profile Swisscom

# Stack erstellen --capabilities CAPABILITY_IAM -disable-rollback ohne NAT Gateway
aws cloudformation create-stack \
    --stack-name VPC-DEV01 \
    --template-body file://cloudformation_VPC_3.yaml \
    --capabilities CAPABILITY_IAM \
    --role-arn arn:aws:iam::824877243403:role/cloudformation-role \
    --disable-rollback \
    --parameters ParameterKey=NatGateways,ParameterValue=false \
    --parameters ParameterKey=SimpleEc3Instance,ParameterValue=false \
    --parameters ParameterKey=FlowLog,ParameterValue=false \
    --profile cloudformation-user

# Change Set erstellen -> Creates a list of changes that will be applied to a stack so that you can review the changes before executing them
aws cloudformation create-change-set \
    --stack-name VPC-DEV01 \
    --change-set-name VPC-DEV01-changes \
    --template-body file://cloudformation_VPC_3.yaml \
    --capabilities CAPABILITY_IAM \
    --role-arn arn:aws:iam::824877243403:role/cloudformation-role \
    --parameters ParameterKey=NatGateways,ParameterValue=false \
    --parameters ParameterKey=SimpleEc2Instance,ParameterValue=false \
    --parameters ParameterKey=SimpleEc3Instance,ParameterValue=false \
    --parameters ParameterKey=FlowLog,ParameterValue=false \
    --profile cloudformation-user 


# Connect to Instance via SSM
aws ssm start-session --target i-001a13efc13b29e24 --profile Swisscom

- [**Best Practice**](https://aws.nz/best-practice/cloudformation-service-roles/)
  
- [**Best Resources**](https://tomgregory.com/creating-aws-cloudformation-resources-using-the-service-role/)