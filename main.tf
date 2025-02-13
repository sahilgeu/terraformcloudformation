provider "aws" {
  region = var.aws_region
}

resource "aws_cloudformation_stack" "cloud_migration_factory" {
  name         = "CloudMigrationFactory"
  template_url = "https://testingcloudformation.s3.ap-south-1.amazonaws.com/cmf.yaml.yaml"
# template_body = file("${path.module}/cloudformation/file1.yaml")

  capabilities = ["CAPABILITY_NAMED_IAM", "CAPABILITY_AUTO_EXPAND"]

  parameters = {
    Application                       = var.application_name
    Environment                       = var.environment_name
    Tracker                           = var.migration_tracker
    ReplatformEC2                     = var.replatform_ec2
    ServiceAccountEmail               = var.service_account_email
    CognitoFederation                 = var.allow_additional_identity_provider
    DeploymentType                    = var.deployment_type
    WebURL                            = var.full_ui_url
    EndpointVPCId                     = var.vpc_id
    PrivateEndpointSubnets            = join(",", var.subnet_ids)
    SourceCIDR = var.deployment_type == "Public with AWS WAF" ? var.allowed_cidr : ""
  }
}
