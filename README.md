# Terraform AWS Module Private Route53 Zones and SubDomains

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.73 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.73 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.subdomains_ns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_route53_zone.subdomains](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application"></a> [application](#input\_application) | The Application Name. | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region Name. | `string` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | Remote State Config | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The Environment Name. | `string` | n/a | yes |
| <a name="input_force_destroy_destroy_all_records"></a> [force\_destroy\_destroy\_all\_records](#input\_force\_destroy\_destroy\_all\_records) | (Optional) Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone. | `bool` | `false` | no |
| <a name="input_subdomains"></a> [subdomains](#input\_subdomains) | Route53 SubDomains List | <pre>list(object({<br>    enabled       = bool<br>    force_destroy = bool<br>    name          = string<br>    type          = string<br>    ttl           = string<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | AWS Tags Standards | `map(any)` | n/a | yes |
| <a name="input_tags_overwritten"></a> [tags\_overwritten](#input\_tags\_overwritten) | AWS Overwritten Tags Standards | `map(any)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | AWS VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application"></a> [application](#output\_application) | Application Name. |
| <a name="output_aws_region"></a> [aws\_region](#output\_aws\_region) | AWS Region. |
| <a name="output_default_tags"></a> [default\_tags](#output\_default\_tags) | Default AWS Tags. |
| <a name="output_environment"></a> [environment](#output\_environment) | Environment Name. |
| <a name="output_environment_config"></a> [environment\_config](#output\_environment\_config) | Environment Map Data. |
| <a name="output_last_iam_current"></a> [last\_iam\_current](#output\_last\_iam\_current) | Last User AWS IAM Data. |
| <a name="output_last_user"></a> [last\_user](#output\_last\_user) | Last AWS IAM UserName. |
| <a name="output_route53_zone_private"></a> [route53\_zone\_private](#output\_route53\_zone\_private) | Private Route53 HostedZone. |
| <a name="output_route53_zone_private_id"></a> [route53\_zone\_private\_id](#output\_route53\_zone\_private\_id) | Private Route53 HostedZone ID. |
| <a name="output_route53_zone_subdomains"></a> [route53\_zone\_subdomains](#output\_route53\_zone\_subdomains) | Route53 Zone SubDomains. |
| <a name="output_route53_zone_subdomains_records"></a> [route53\_zone\_subdomains\_records](#output\_route53\_zone\_subdomains\_records) | Route53 Zone SubDomains Records. |
| <a name="output_tags"></a> [tags](#output\_tags) | AWS Tags. |
| <a name="output_tags_overwritten"></a> [tags\_overwritten](#output\_tags\_overwritten) | AWS Overwritten Tags. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | AWS VPC ID. |
| <a name="output_zone_private"></a> [zone\_private](#output\_zone\_private) | Route53 Private Zone Config Data. |
| <a name="output_zone_subdomains"></a> [zone\_subdomains](#output\_zone\_subdomains) | Route53 Private Zone SubDomains Config Data. |
