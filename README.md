# wordpress-fargate:
An example project that deploys Wordpress to ECS Fargate w/ an Aurora MySql database. Uses the stelligent/mu framework for pipeline management.

## Getting Started

1. Clone the repo locally.
2. Install [stelligent/mu](https://github.com/stelligent/mu).
3. Create an IAM user and configure access keys.
4. Put the access key id and secret in separate parameters in parameter store.
5. Update mu.yml with the names of the parameters.
4. Run `mu pipeline up`.
5. Input a [GitHub OAuth Token](https://github.com/settings/tokens) when prompted.
6. See [stelligent/mu](https://github.com/stelligent/mu) documentation for details.

## Limitations

1. The WP Offload S3 Lite Plugin doesn't support ECS Task IAM Roles. To work-around this
we need to create an IAM user, and configure access keys. Currently the access key id and
secret are stored in parameter store. The name of the parameters are defined as environment
variables in mu.yml.

## TODO:

* Auto-put secrets in parameter store as part of template.
* Pretty Diagrams
* CloudFront Configuration

## References

* [Wordpress Docker Image](https://hub.docker.com/_/wordpress/)
