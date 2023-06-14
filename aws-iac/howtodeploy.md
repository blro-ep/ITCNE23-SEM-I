AWS how to deploy
==== 

## Table of Content

* 01 - [AWS CLI Access ](#01-AWS-CLI-Access)
* 02 - [Prerequisite](#02-Prerequisite)
* 03 - [Deployment](#03-Deployment)
* 04 - [Stack Information](#04-Stack-Information)
* 05 - [Update stack ](#05-Update-stack)
* 06 - [Termination Protection](#06-Termination-Protection)
* 07 - [IAM User for Roger](#07-IAM-User-for-Roger)
* 08 - [Delete stack](#08-Delete-stack)
* 09 - [etc.](#09-etc.)


## 01 AWS CLI Access

1. Go To the AWS Console 
2. Open IAM and in the Dashboard Open "My security credentials" 
3. "Create access key" approve and click "Create access key"  again 
4. download your "Access key" and your "Secret access key"

![Access key](images/accesskey.png)  

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

### IAM CloudFormation User

Setting up an IAM user for CloudFormation is best Practice to improve security, access control and accountability for your AWS resources. 

> It is a part of AWS Well Architect Framework for using CloudFormation and allows you to track and audit actions performed, while allowing you to fine-grained access control based on roles, groups and policy.


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

![CLI Profile](images/cli-profile.png)  

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

Here we will attach the newly created role a policy to have AdministratorAccess for creating all the Services needed. 

```
aws iam put-role-policy \
    --role-name cloudformation-role \
    --policy-name cloudformation-policy \
    --policy-document file://cloudformation-role-policy.txt \
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


1. Create a new keypair for the EC2 instances named gmail

```
aws ec2 create-key-pair --key-name gmail
```

### CLI S3 Bucket erstellen 

8. You need a S3 Bucket to upload your CloudFormation Templates to
   
```
$ aws s3api create-bucket \
    --bucket devdeploysemzh \
    --region eu-central-2 \
    --create-bucket-configuration LocationConstraint=eu-central-2 \
    --profile gmail 
```

### Test funktionalität s3 Bucket Listing:

```
aws s3 ls --profile gmail
```

### Cloud Formation Package erstellen:

9. To make the deployment of our Template more convenient, we can use the Cloud Formation Package CLI commend

> This allows the CloudFormation template to be deployed without having to manually upload the different yaml code files to S3 separately. 

```
$ aws cloudformation package \
    --template-file cloudformation_VPC.yaml \
    --output-template packaged.yaml \
    --s3-bucket devdeploysemzh \
    --profile cloudformation-user
```

10. Now we have a new output to packaged.yaml that reflects a new "packaged" template with all necessary assets uploaded to your deployment s3 bucket and the nasted URL Changed.

----

## 03 Deployment

### Stack deploy with CLI

Optional to pass a parameter file with the parameter-overrides flag:
> --parameter-overrides file://parameter.json  \

Now you need the ARN of the cloudformation-user role to pass it to the stack creation command

```
aws cloudformation deploy \
    --template-file packaged.yaml \
    --stack-name VPC-DEV01 \
    --capabilities CAPABILITY_IAM \
    --capabilities CAPABILITY_NAMED_IAM \
    --role-arn arn:aws:iam::824877243403:role/cloudformation-role \
    --profile cloudformation-user
```

To check the status of the stack creation you can use the following command:

```
aws cloudformation describe-change-set --changeset-name VPC-DEV01
```

### Validate Monitoring Template

Before we deploy the Monitoring Stack we can validate the template with the following command:

```
aws cloudformation validate-template --template-body file://templates/monitoring.yaml --profile cloudformation-user
```

### Deploy the Monitoring Stack with AWS cli

Here we will deploy the Monitoring Stack with the following command:

**Optional** 

to pass a parameter file with the parameter-overrides flag:
> --parameter-overrides file://parameter.json  \

Give the stack a Parameter with the name of the EnvironmentName and the value VPC-DEV01
> --parameters ParameterKey=EnvironmentName,ParameterValue=VPC-DEV01 \

To enable the termination protection of the stack we can use the following flag:
> --enable-termination-protection \

To disable the FlowLog Parameter we can use the following flag:
> --parameters ParameterKey=FlowLog,ParameterValue=false \

To disable the SimpleEc3Instance Parameter we can use the following flag:
> --parameters ParameterKey=SimpleEc3Instance,ParameterValue=false \

**In this case we create a new stack with the name MonitoringStack directly from the template file and don't need to package it first, because we don't have any nested templates.**

```
# Stack erstellen 
aws cloudformation create-stack \
    --stack-name MonitoringStack \
    --template-body file://templates/monitoring.yaml \
    --role-arn arn:aws:iam::824877243403:role/cloudformation-role \
    --profile cloudformation-user
```

## 04 Stack Information

How to get the stack information with the CLI during the deployment process?

```
aws cloudformation describe-stacks --stack-name VPC-DEV01 --profile cloudformation-user
```

With following command you can look at the individual events that happened to the stack

```
aws cloudformation describe-stack-events --stack-name VPC-DEV01 --profile cloudformation-user
```

To wait for the stack creation to be completed you can use the following command:

```
aws cloudformation wait stack-create-complete \
    --stack-name MonitoringStack \
    --region eu-central-2 \
    --role-arn arn:aws:iam::824877243403:role/cloudformation-role \
    --profile cloudformation-user
```

**Via Console its possible to see the Stack Events in the CloudFormation Service**

> Specially the Outputs of the different Stacks are important to know for the next steps.

Here we can see the command to connect to the Dev Instance and the URL of the Webpage
![DEV Instance Stack Output](images/devinstance.png)  

Here we can see the command to connect to the Monitoring Instance and the URL of the Loadbalancer
![Monitoring Stack Output](images/monitoringstack.png)  

## 05 Update stack 

If you want to update the stack you can use the following command:

**Optional** 

To disable the rollback of the stack in case of an error we can use the following flag:
> --disable-rollback \

```
aws cloudformation update-stack 
    --stack-name VPC-DEV01 \
    --template-body file://templates/monitoring.yaml 
    --capabilities CAPABILITY_IAM \
    --disable-rollback \
    --role-arn arn:aws:iam::824877243403:role/cloudformation-role \
    --profile cloudformation-user
```

## 06 Termination Protection

To enable the termination protection of the stack we can use the following command:

> This is specially important on the Main Stack to prevent the deletion of the stack by accident.

Here we need elevated rights to do it and we use the gmail profile to do it.
```
aws cloudformation update-termination-protection \
    --stack-name VPC-DEV01 \
    --enable-termination-protection \
    --profile gmail
```
## 07 IAM User for Roger

So Roger is able to troubleshoot the Monitoring Stack we need to create a IAM User for him.

1. We follow the steps 1 - 3 in [IAM CloudFormation User](#02-Prerequisite) to create a User with Access key for Roger
2. Attaching a Inline Policy to the newly created user (roger-user-policy.txt)

This policy allows roger to , read information from the CloudFormation Stacks and work with the SSM, with no resource restrictions.
   
```
aws iam put-user-policy \
    --user-name roger \
    --policy-name roger-user-policy \
    --policy-document file://roger-user-policy.txt \
    --profile gmail
```

3. We send the Access Key and Secret Key to Roger
4. With following command Roger is able to see the Stack Information

```
aws cloudformation describe-stacks --stack-name MonitoringStack --profile roger
```

1. In Outputs of the Monitoring Stack Roger can see all the information he needs to connect to the Monitoring Instance and the URL.

## 08 Delete stack

Before we delete the stack we need to disable the termination protection of the stack with the following command:

```
aws cloudformation update-termination-protection \
    --stack-name VPC-DEV01 \
    --no-enable-termination-protection \
    --profile gmail
```

Stack löschen  mit --retain-resources option 

```
aws cloudformation delete-stack \
    --stack-name VPC-DEV01 \
    --retain-resources \
    --role-arn arn:aws:iam::824877243403:role/cloudformation-role \
    --profile cloudformation-user
```
## 09 Deploy to a different region

To deploy the stack to a different region we need to change the region in the command and the region in the template file.

1. Change the region in the command to eu-central-1
![DEV Instance Stack Output](images/cliprofileregion.png)  

2. Create a new keypair in eu-central-1

```
aws ec2 create-key-pair --key-name gmail
```

3. create a new bucket in eu-central-1

```
$ aws s3api create-bucket \
    --bucket devdeploysemfr \
    --region eu-central-1 \
    --create-bucket-configuration LocationConstraint=eu-central-1 \
    --profile gmail 
```

3. Upload the template file to the new bucket

```
$ aws cloudformation package \
    --template-file cloudformation_VPC.yaml \
    --output-template packaged.yaml \
    --s3-bucket devdeploysemfr \
    --profile cloudformation-user
```

4. Deploy the stack to eu-central-1

```
aws cloudformation deploy \
    --template-file packaged.yaml \
    --stack-name VPC-DEV01 \
    --capabilities CAPABILITY_IAM \
    --capabilities CAPABILITY_NAMED_IAM \
    --role-arn arn:aws:iam::824877243403:role/cloudformation-role \
    --s3-bucket devdeploysemfr \
    --profile cloudformation-user
```


--------------
## 10 etc. 

### config File auf S3 Laden 

> aws s3 cp simpleec2.yaml s3://config-bucket-931336182845 --profile Swisscom

> aws s3 cp simpleec3.yaml s3://config-bucket-931336182845 --profile Swisscom


### Change Set erstellen 

Creates a list of changes that will be applied to a stack so that you can review the changes before executing them

```
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
```

### Connect to Instance via SSM

aws ssm start-session --target i-001a13efc13b29e24 --profile Swisscom

### Sources

- [**Best Practice**](https://aws.nz/best-practice/cloudformation-service-roles/)
- [**Best Resources**](https://tomgregory.com/creating-aws-cloudformation-resources-using-the-service-role/)
- [**Service Roles**](https://aws.nz/best-practice/cloudformation-service-roles/)
- [**Roles**](https://aws.amazon.com/de/blogs/mt/using-aws-cloudformation-to-create-and-manage-aws-service-roles/)
- [**Blog Post**](https://agardner.io/2019/07/18/aws-cloudformation-automation-in