variable "aws_region" {
  description = "AWS Region to deploy Cloud Migration Factory"
  type = string
}

variable "application_name" {
  description = "Prefix for AWS resources"
  type        = string
}

variable "environment_name" {
  description = "Environment identifier (e.g., test, dev, prod)"
  type        = string
}

variable "migration_tracker" {
  description = "Enable migration tracker dashboard"
  type        = bool
  default = false
}

variable "replatform_ec2" {
  description = "Enable Replatform EC2 feature"
  type        = bool
  default = false
}

variable "service_account_email" {
  description = "Service account email for automation scripts"
  type        = string
}

variable "allow_additional_identity_provider" {
  description = "Allow external SAML identity providers"
  type        = bool
  default = false
}

variable "deployment_type" {
  description = "Deployment type: Public, Public with AWS WAF, or Private"
  type = string
}

variable "full_ui_url" {
  description = "Full UI URL (Required if DeploymentType is Private)"
  type        = string
  default = ""
}

variable "vpc_id" {
  description = "VPC ID (Required if DeploymentType is Private)"
  type        = string
  default     = ""
}

variable "subnet_ids" {
  description = "Subnet IDs (Required if DeploymentType is Private)"
  type        = list(string)
  default     = []
}

variable "allowed_cidr" {
  description = "Allowed CIDR (Required if DeploymentType is Public with AWS WAF)"
  type        = string
  default = ""
}
