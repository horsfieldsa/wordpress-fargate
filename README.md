# wordpress-fargate:
An example project that deploys Wordpress to ECS Fargate w/ an Aurora MySql database. Uses the stelligent/mu framework for pipeline management.

## Getting Started

1. Clone the repo locally.
2. Install [AWS CLI](https://aws.amazon.com/cli/).
3. Create an [IAM Dev User](https://console.aws.amazon.com/iam/home?#/users) with the following Policy `AdministratorAccess`
4. Run AWS Configure `aws configure`
	* Put In your access key and secret from step 3 when prompted 
5. Install [stelligent/mu](https://github.com/stelligent/mu).
6. Create an [IAM Application User](https://console.aws.amazon.com/iam/home?#/users) and configure access keys. User should have at least the following permissions:
    * s3:GetObject
    * s3:GetObjectVersion
    * s3:GetObjectVersionTagging
    * s3:DeleteObject
    * s3:DeleteObjectVersion
    * s3:DeleteObjectTagging
    * s3:PutObject
    * s3:PutObjectAcl
    * s3:PutObjectTagging
    * s3:ListBucket
    * s3:ListAllMyBuckets
    * s3:ListBucketVersions

    * NOTE: The template will create a user with these permissions that you can assign an access key to, however this requires two deployments (one to create the access key, then a manual step, then another to set the environment variable)
5. Put the access key id and secret in separate parameters in parameter store which can be found in [EC2 Systems Manager](https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#Parameters:sort=Name)
6. Update mu.yml with the names of the parameters, just use the name of key, the docker file will call getParameter to decode the actual value, no brackets are needed
7. Create a new Hosted zone for your domain in Route 52 and ensure your domain is set up to use amazon's nameservers
8. Run `mu pipeline up`.
	* Input a [GitHub OAuth Token](https://github.com/settings/tokens) when prompted.
	* See [stelligent/mu](https://github.com/stelligent/mu) documentation for details.
9. Logon to Wordpress by navigating to your domain (Create Admin/Password).
10. Enable WP Offload S3 Lite Plugin
11. Enable the following Settings:
    * Copy Files to S3
    * Rewrite File URLs
    * CloudFront or Custom Domain
    * Remove Files From Server

## Limitations

1. The WP Offload S3 Lite Plugin doesn't support ECS Task IAM Roles. To work-around this
we need to create an IAM user, and configure access keys. Currently the access key id and
secret are stored in parameter store. The name of the parameters are defined as environment
variables in mu.yml.
2. You have to manually activate the WP Offload S3 Lite Plugin, and configure some of its settings.
3. Plugins are not handled in a way that they can be applied across all tasks without re-building
the docker container image. If Fargate handled peristent data-volumes this could be solved, or the provider
could be changed from ECS-FARGATE to ECS, and the templates could be updated to handle an EFS volume. This would
require a process for building a custom AMI or bootstrap an ECS optimized AMI. [Tutorial](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/using_efs.htmlm)
4. Wordpress upgrades are not handled (this is tracked as an issue in the official Docker image).

## TODO:

* Put WP Offload S3 Lite settings in entrypoint.sh script.
* Auto-put secrets in parameter store as part of template. (Create User, Create Access Key, Create Parameter).
* Error handling in entrypoint script.
* Pretty Diagrams
* CloudFront Configuration

## References

* [Wordpress Docker Image](https://hub.docker.com/_/wordpress/)
