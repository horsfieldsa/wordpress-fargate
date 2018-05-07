# wordpress-fargate:
An example project that deploys Wordpress to ECS Fargate w/ an Aurora MySql database. Uses the stelligent/mu framework for pipeline management.

## Getting Started

1. Clone the repo locally.
2. Install [stelligent/mu](https://github.com/stelligent/mu).
3. Run `mu pipeline up`.
4. Input a [GitHub OAuth Token](https://github.com/settings/tokens) when prompted.
5. See [stelligent/mu](https://github.com/stelligent/mu) documentation for details.

## Limitations

1. Currently you need to manually activate and configure the WP Offload S3 Lite Plugin.
2. Currently you need to manually create an IAM user for the WP Offload S3 Lite Plugin.

## TODO:

* Pretty Diagrams
* Shared storage for User Uploads (S3)
* CloudFront Configuration
* Better Secrets Management (Pull from Parameter Store in Entrypoint Script?)
* Enable and Configure WP Offload S3 Lite Plugin
* Update Task Role to include required permissions.
* Configure plugin

```
## Bucket Name?
AWS_USE_EC2_IAM_ROLE: Not defined
AS3CF_BUCKET: Not defined
AS3CF_REGION: Not defined
```

## References

* [Wordpress Docker Image](https://hub.docker.com/_/wordpress/)
