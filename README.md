# wordpress-fargate:
An example project that deploys Wordpress to ECS Fargate w/ an Aurora MySql database. Uses the stelligent/mu framework for pipeline management.

## Getting Started

1. Clone the repo locally.
2. Install [stelligent/mu](https://github.com/stelligent/mu).
3. Run `mu pipeline up`.
4. Input a [GitHub OAuth Token](https://github.com/settings/tokens) when prompted.
5. See [stelligent/mu](https://github.com/stelligent/mu) documentation for details.

## TODO:

* Pretty Diagrams
* Shared storage for Config/Themes/Etc. (EFS) (Docker local mount to EFS?)
* Create EFS Mount in Template
* CloudFront Configuration
* Better Secrets Management

## References

* [Wordpress Docker Image](https://hub.docker.com/_/wordpress/)
