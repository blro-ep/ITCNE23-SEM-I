
# Folgendes eingeben um das Profile einzurichten:

$ aws configure --profile Swisscom
AWS Access Key ID [None]: AS
AWS Secret Access Key [None]: /qC
Default region name [None]: eu-central-2
Default output format [None]: yaml

# Oder File anpassen:
AWS credentials file (typically found at ~/.aws/credentials) 
vi ~/.aws/credentials

[Swisscom]
aws_access_key_id=
aws_secret_access_key=
aws_session_token=


# Anzeigen aller Profile
aws configure list-profiles
