# wordpress-fargate:
An example project that deploys Wordpress to ECS Fargate w/ an Aurora MySql database. Uses the stelligent/mu framework for pipeline management.

## Getting Started

1. Clone the repo locally.
2. Install [stelligent/mu](https://github.com/stelligent/mu).
3. Run `mu pipeline up`.
4. Input a [GitHub OAuth Token](https://github.com/settings/tokens) when prompted.
5. See [stelligent/mu](https://github.com/stelligent/mu) documentation for details.

## Gotchas

1. Upon initial deployment Wordpress returns a 302 when accessing /. This causes issues
with the Target Group health-check rule. So until I fix this, you need to manually update the health
check to include HTTP 302 as a successful response code. (This doesn't seem to be supported yet in
Mu)

## TODO:

* ALB TG Health-Checks for HTTP 302 or new /health endpoint.
* Pretty Diagrams
* Domain configuration
* Shared storage for Config/Themes/Etc. (EFS)
* CloudFront
* Better Secrets Management

## References

* [Wordpress Docker Image](https://hub.docker.com/_/wordpress/)
