# Terraform-aws-target-group-monitor

Terraform-aws-cloudwatch-msk is a Terraform module for setting up a notification system about cloudwatch msk metrics.

## Installation

To use this module, you need to have Terraform installed. You can find installation instructions on the Terraform website.

## Usage

The module will create a notification system about your msk cluster.
Use this module multiple times to create repositories with different configurations.

Include this repository as a module in your existing terraform code:

```python

provider "aws" {
  region = var.aws_region
  }

################################################################################
# AWS MSK
################################################################################


module "msk" {
  source = "../"

  msk_brocker_id = 3
  cluster_name   = "kafka"
  tags = {
    Environment = "dev"
  }
  aws_sns_topic_arn  = aws_sns_topic.opsgenie_topic.arn
}

```

## information

1. this module is for the basic alerts: high cpu, high memory.
   If you want to alert advanced metrics, you should create your msk cluster with those level of logs: "PER_TOPIC_PER_PARTITION"

   for more information look here: [Link text Here](https://docs.aws.amazon.com/msk/latest/developerguide/metrics-details.html)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.67.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_alarm.high_cpu_system](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.high_cpu_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.high_disk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_sns_topic_arn"></a> [aws\_sns\_topic\_arn](#input\_aws\_sns\_topic\_arn) | ARN of the SNS topic | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the MSK cluster | `string` | `null` | no |
| <a name="input_high_cpu_system_enabled"></a> [high\_cpu\_system\_enabled](#input\_high\_cpu\_system\_enabled) | Enable high CPU system alarm | `bool` | `true` | no |
| <a name="input_high_cpu_system_threshold"></a> [high\_cpu\_system\_threshold](#input\_high\_cpu\_system\_threshold) | The threshold for high CPU system usage | `number` | `90` | no |
| <a name="input_high_cpu_user_enabled"></a> [high\_cpu\_user\_enabled](#input\_high\_cpu\_user\_enabled) | Enable high CPU user alarm | `bool` | `true` | no |
| <a name="input_high_cpu_user_threshold"></a> [high\_cpu\_user\_threshold](#input\_high\_cpu\_user\_threshold) | The threshold for high CPU user usage | `number` | `90` | no |
| <a name="input_high_disk_enabled"></a> [high\_disk\_enabled](#input\_high\_disk\_enabled) | Enable high disk alarm | `bool` | `true` | no |
| <a name="input_high_disk_threshold"></a> [high\_disk\_threshold](#input\_high\_disk\_threshold) | The threshold for high disk usage | `number` | `85` | no |
| <a name="input_msk_brocker_id"></a> [msk\_brocker\_id](#input\_msk\_brocker\_id) | The ID of the MSK broker to monitor | `number` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the resources | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->