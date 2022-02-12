/*
    Required Variables
*/
variable "aws_region" {
  description = "AWS Region Name."
  type        = string
}

variable "application" {
  description = "The Application Name."
  type        = string
}

variable "environment" {
  description = "The Environment Name."
  type        = string
  validation {
    condition = anytrue([
      var.environment == "development",
      var.environment == "production",
      var.environment == "sandbox",
      var.environment == "staging",
      var.environment == "test"
    ])
    error_message = "Must be a valid environment, can be production, staging, development, test or sandbox."
  }
}

/*
    VPC Info Variables
*/
variable "vpc_id" {
  description = "AWS VPC ID"
  type        = string
}

/*
    Route53 Variables
*/
variable "domain" {
  description = "Remote State Config"
  type        = string
}

variable "subdomains" {
  description = "Route53 SubDomains List"
  type = list(object({
    enabled       = bool
    force_destroy = bool
    name          = string
    type          = string
    ttl           = string
  }))
  default = []
}

variable "force_destroy_destroy_all_records" {
  description = "(Optional) Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone."
  type        = bool
  default     = false
}

/*
    Tags
*/
variable "tags" {
  description = "AWS Tags Standards"
  type        = map(any)
}

variable "tags_overwritten" {
  description = "AWS Overwritten Tags Standards"
  type        = map(any)
  default     = {}
}
