# wordpress-fargate:
An example project that deploys Wordpress to ECS Fargate w/ an Aurora MySql database. Uses the stelligent/mu framework for pipeline management.

## Getting Started

1. Clone the repo locally.
2. Install [stelligent/mu](https://github.com/stelligent/mu).
3. Run `mu pipeline up`.
4. Input a [GitHub OAuth Token](https://github.com/settings/tokens) when prompted.
5. See [stelligent/mu](https://github.com/stelligent/mu) documentation for details.

## Limitations

1. The WP Offload S3 Lite Plugin doesn't support ECS Task IAM Roles. To work-around this
we need to create an IAM user, and configure access keys.
2. Unable to get Environment vars to properly reference AccessKey and SecretAccessKey,
to work around this currently you need to manually create a new task definition, assign
the environment variables, and update the service. Yes this sucks and I'm working on fixing
it with either env-kms, or pulling secrets from parameter store.

## TODO:

* Pretty Diagrams
* Shared storage for User Uploads (S3)
* CloudFront Configuration
* Better Secrets Management (Pull from Parameter Store in Entrypoint Script?)

## References

* [Wordpress Docker Image](https://hub.docker.com/_/wordpress/)
