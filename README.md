# terraform-cloudfoundry-siderite-backend

Module to deploy a Siderite backend for `hsdp_function` resource. The module is still evolving and getting
new features. Be sure to follow the releases closely as we work towards the `1.0.0` release.

<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| cloudfoundry | >= 0.14.1 |
| hsdp | >= 0.20.5 |
| random | >= 2.2.1 |

## Providers

| Name | Version |
|------|---------|
| cloudfoundry | >= 0.14.1 |
| hsdp | >= 0.20.5 |
| random | >= 2.2.1 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [cloudfoundry_app](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/resources/app) |
| [cloudfoundry_domain](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/data-sources/domain) |
| [cloudfoundry_org](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/data-sources/org) |
| [cloudfoundry_route](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/resources/route) |
| [cloudfoundry_service](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/data-sources/service) |
| [cloudfoundry_service_instance](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/resources/service_instance) |
| [cloudfoundry_service_key](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/resources/service_key) |
| [cloudfoundry_space](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/data-sources/space) |
| [cloudfoundry_space](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/resources/space) |
| [cloudfoundry_space_users](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/resources/space_users) |
| [cloudfoundry_user](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/data-sources/user) |
| [hsdp_config](https://registry.terraform.io/providers/philips-software/hsdp/latest/docs/data-sources/config) |
| [random_id](https://registry.terraform.io/providers/random/latest/docs/resources/id) |
| [random_password](https://registry.terraform.io/providers/random/latest/docs/resources/password) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| auth\_iam\_client\_id | The IAN OAuth2 client ID | `string` | `""` | no |
| auth\_iam\_client\_secret | The IAM OAuth2 client secret | `string` | `""` | no |
| auth\_iam\_environment | IAM environment | `string` | `"client-test"` | no |
| auth\_iam\_orgs | List of IAM ORG IDs to allow | `list(string)` | `[]` | no |
| auth\_iam\_region | IAM region | `string` | `"us-east"` | no |
| auth\_iam\_roles | The roles within the IAM ORG that grants access | `list(string)` | `[]` | no |
| base\_url | base URL for iron service | `string` | `""` | no |
| cf\_org\_name | Cloudfoundry ORG name to use for reverse proxy | `string` | n/a | yes |
| cf\_region | The CF region to deploy into | `string` | n/a | yes |
| cf\_space | The space where to deploy components to. If not specified a new space will be created | `string` | `""` | no |
| cf\_user | The Cloudfoundry user to assign rights to the app to | `string` | n/a | yes |
| docker\_password | Docker registry password | `string` | `""` | no |
| docker\_username | Docker registry username | `string` | `""` | no |
| enable\_gateway | Enable a gateway endpoint so you can trigger functions through HTTPS | `bool` | `true` | no |
| environment | Pass environment variable to the app | `map(any)` | `{}` | no |
| function\_gateway\_image | Image to use for Function Gateway app. Use a v* tagged version to prevent automatic updates | `string` | `"philipslabs/hsdp-func-gateway:v1.0.0"` | no |
| gateway\_auth\_type | Enable authorization for endpoints on the gateway. Supported types: ['none', 'token', 'iam'] | `string` | `"token"` | no |
| gateway\_disk\_quota | Gateway disk quota | `number` | `1024` | no |
| gateway\_memory | Gateway memory | `number` | `64` | no |
| iron\_plan | The Iron plan to use | `string` | `"dev-large-encrypted"` | no |
| name\_postfix | The postfix string to append to the space, hostname, etc. Prevents namespace clashes | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| api\_endpoint | The API endpoint of the gateway (when enabled) |
| auth\_type | The API gateway auth type |
| credentials | Siderite credentials |
| token | The authentication token for the gateway |

<!--- END_TF_DOCS --->

# Contact / Getting help

Please post your questions on the HSDP Slack `#terraform` channel

# License
[License](./LICENSE.md) is MIT
