# Offene Fragen

Passing Parameter to ec3 
Use Secrets Manager and Parameter store : https://catalog.workshops.aws/cfn101/en-US/intermediate/templates/dynamic-references
Use Conditions test und prod environment for different Sizes
Write Ec2 Instance Information online (Modify index.php) -> https://catalog.workshops.aws/cfn101/en-US/basics/operations/helper-scripts
Use the Parameter store -> https://catalog.workshops.aws/cfn101/en-US/basics/templates/pseudo-parameters
Session Manager -> Activate Logging in CloudWatch
Public Key mitgeben über Parameter? für SSH Loggin in ec2
Endpoint Subnet kann nur ein Subnet in einer Av sein ? Public oder Private ? ->  EC2MessagesVpcEndpoint:
eigener SSH Key mitgeben für simpleec2? 
NACL für Private Out alles offen
simpleec3 AvailabilityZone: eu-central-2b fest programmiert
Mapping für Instance Size or Ort erstellen
Mit oder ohne db ?
Work with Secret Manager to store PW 

Stack Deeleten Protection?

CloudFormation Template for the prerequests ?
https://aws.nz/best-practice/cloudformation-service-roles/

Nat Gateway Alarms
https://github.com/cfn-modules/vpc-nat-gateway/blob/master/module.yml

Cloud Formation best Pracice 
https://www.youtube.com/watch?v=bJHHQM7GGro&t=10s
https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/best-practices.html


Layering multiple templates

TAGGNING

https://docs.aws.amazon.com/tag-editor/latest/userguide/tagging.html

Zscaler IaC Scan
By Zscaler CWP

Fault tolerence for 1 endpoint for each Availability Zone?

Just Gateway is for Free!
The above diagram shows that EC2 instances in the private subnet are accessing S3 and DynamoDB through gateway endpoints. One gateway endpoint is for S3, while another one is for DynamoDB. This traffic does not leave the amazon network, and it does not enter the public internet. As a result, communication is not only secure but fast as well. As it is free, you should take advantage of gateway endpoints whenever you can.

Zscaler IaC Scan logo
Scan your Infrastructure as Code files using Zscaler Infrastructure as Code (IaC) Scan app

Github Action Automatischer Scann ausfürhen des Codes?
https://blog.telekom-mms.com/tech-insights/arbeiten-mit-github-actions-und-reusable-workflows

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html
User data and the AWS CLI
aws ec2 run-instances --image-id ami-abcd1234 --count 1 --instance-type m3.medium \
--key-name my-key-pair --subnet-id subnet-abcd1234 --security-group-ids sg-abcd1234 \
--user-data file://my_script.txt



Berrechtigugen mit TAGs vergeben 
Team = Dev / Test
Project = Unicorn

Use AWS Config 
Use inspector on a ec2 instance
AWS Secrets Manager interface endpoint, and other networking components.
CloudFormation template to set up an Amazon Linux bastion host in an Auto Scaling group to connect to 

Best Practive Use conditions for reuse of the template for test and prod envirement: https://catalog.workshops.aws/cfn101/en-US/intermediate/templates/conditions

# Projekt

. Good project management is about establishing clear goals, setting out an efficient work schedule, maintaining budget control, and tracking progress



# Aufbau
Plan a build in AWS CodeBuild -> https://docs.aws.amazon.com/codebuild/latest/userguide/planning.html GitHub

# Testing

Mettadaten 

Links dokumentierung:

MuleSoftRtfIntegration:
    Type: String
    Description: >-
      For more information, see
      https://github.com/aws-quickstart/quickstart-eks-mulesoft-runtime-fabric/.
    AllowedValues: [Enabled, Disabled]
    Default: Disabled

# Vereinheitlichung Nestling
How to nestle tham so you can use the singe nestling items ?
Nat Gateway ausschalten

# Outputs 
Exports
