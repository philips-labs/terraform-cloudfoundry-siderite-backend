<img src="https://cdn.rawgit.com/hashicorp/terraform-website/master/content/source/assets/images/logo-hashicorp.svg" width="500px">

# terraform-cloudfoundry-siderite-backend

Module to deploy a Siderite backend for `hsdp_function` resource. The module is still evolving and getting
new features. Be sure to follow the releases closely until we hit a `1.0.0` release.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| cloudfoundry | >= 0.1300.0 |
| hsdp | >= 0.13.1 |
| random | >= 2.2.1 |

## Providers

| Name | Version |
|------|---------|
| cloudfoundry | >= 0.1300.0 |
| hsdp | >= 0.13.1 |
| random | >= 2.2.1 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [cloudfoundry_app](https://registry.terraform.io/providers/philips-labs/cloudfoundry/0.1300.0/docs/resources/app) |
| [cloudfoundry_domain](https://registry.terraform.io/providers/philips-labs/cloudfoundry/0.1300.0/docs/data-sources/domain) |
| [cloudfoundry_org](https://registry.terraform.io/providers/philips-labs/cloudfoundry/0.1300.0/docs/data-sources/org) |
| [cloudfoundry_route](https://registry.terraform.io/providers/philips-labs/cloudfoundry/0.1300.0/docs/resources/route) |
| [cloudfoundry_service](https://registry.terraform.io/providers/philips-labs/cloudfoundry/0.1300.0/docs/data-sources/service) |
| [cloudfoundry_service_instance](https://registry.terraform.io/providers/philips-labs/cloudfoundry/0.1300.0/docs/resources/service_instance) |
| [cloudfoundry_service_key](https://registry.terraform.io/providers/philips-labs/cloudfoundry/0.1300.0/docs/resources/service_key) |
| [cloudfoundry_space](https://registry.terraform.io/providers/philips-labs/cloudfoundry/0.1300.0/docs/resources/space) |
| [cloudfoundry_space_users](https://registry.terraform.io/providers/philips-labs/cloudfoundry/0.1300.0/docs/resources/space_users) |
| [cloudfoundry_user](https://registry.terraform.io/providers/philips-labs/cloudfoundry/0.1300.0/docs/data-sources/user) |
| [hsdp_config](https://registry.terraform.io/providers/philips-software/hsdp/0.13.1/docs/data-sources/config) |
| [random_id](https://registry.terraform.io/providers/random/2.2.1/docs/resources/id) |
| [random_password](https://registry.terraform.io/providers/random/2.2.1/docs/resources/password) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| auth\_iam\_client\_id | The IAN OAuth2 client ID | `string` | `""` | no |
| auth\_iam\_client\_secret | The IAN OAuth2 client secret | `string` | `""` | no |
| auth\_iam\_environment | IAM environment | `string` | `"client-test"` | no |
| auth\_iam\_orgs | List of IAM ORG IDs to allow | `list(string)` | `[]` | no |
| auth\_iam\_region | IAM region | `string` | `"us-east"` | no |
| auth\_iam\_role | The role within the IAM ORG that grants access | `string` | `"HSDP_FUNCTION"` | no |
| cf\_org\_name | Cloudfoundry ORG name to use for reverse proxy | `string` | n/a | yes |
| cf\_region | The CF region to deploy into | `string` | n/a | yes |
| cf\_user | The Cloudfoundry user to assign rights to the app to | `string` | n/a | yes |
| docker\_password | Docker registry password | `string` | `""` | no |
| docker\_username | Docker registry username | `string` | `""` | no |
| environment | Pass environment variable to the app | `map(any)` | `{}` | no |
| function\_gateway\_image | Image to use for Function Gateway app. Use a v* tagged version to prevent automatic updates | `string` | `"philipslabs/hsdp-func-gateway:v0.0.16"` | no |
| gateway\_auth\_type | Enable authorization for endpoints on the gateway. Supported types: ['none', 'token', 'iam'] | `string` | `"none"` | no |
| gateway\_disk\_quota | Gateway disk quota | `number` | `1024` | no |
| gateway\_enabled | Enable a gateway endpoint so you can trigger functions through HTTPS | `bool` | `true` | no |
| gateway\_memory | Gateway memory | `number` | `64` | no |
| iron\_plan | The Iron plan to use | `string` | `"dev-large-encrypted"` | no |
| name\_postfix | The postfix string to append to the space, hostname, etc. Prevents namespace clashes | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| credentials | Siderite credentials |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# Contact / Getting help

Please post your questions on the HSDP Slack `#terraform` channel

# License
[License](./LICENSE.md) is MIT
