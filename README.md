![image info](logo.jpeg)

# Terraform-aws-msk-cloudwatch

Terraform-aws-msk-cloudwatch is a Terraform module for setting up a notification system about cloudwatch msk metrics.

## Installation

To use this module, you need to have Terraform installed. You can find installation instructions on the Terraform website.

## Usage

The module will create a notification system about your msk cluster.
Use this module multiple times to create repositories with different configurations.

Include this repository as a module in your existing terraform code:

```python

################################################################################
# AWS MSK
################################################################################


provider "aws" {
  region = "eu-west-1"
}

resource "aws_sns_topic" "sns_topic" {
  name         = "sns"
  display_name = "sns"
}

resource "aws_sns_topic_subscription" "sns_subscription" {
  confirmation_timeout_in_minutes = 1
  endpoint_auto_confirms          = false
  topic_arn                       = aws_sns_topic.sns_topic.arn
  protocol                        = "https"
  endpoint                        = "https://api.sns.com/v1/xxx"
  depends_on                      = [aws_sns_topic.sns_topic]
}
module "msk_alarms" {
  source              = "delivops/msk-alerts/aws"
  #version            = "0.0.1"

  cluster_name        = "your-cluster-name"
  high_disk_threshold = 85
  all_alarms_sns_arns   = [aws_sns_topic.sns_topic.arn]
  tags = {
    Environment = "production"
  }
}

```

## information

1. this module is for the basic alerts: high cpu, high memory.
   If you want to alert advanced metrics, you should create your msk cluster with those level of logs: "PER_TOPIC_PER_PARTITION"

   for more information look here: [Link text Here](https://docs.aws.amazon.com/msk/latest/developerguide/metrics-details.html)

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                   | Version   |
| ------------------------------------------------------ | --------- |
| <a name="requirement_aws"></a> [aws](#requirement_aws) | >= 4.67.0 |

## Providers

| Name                                             | Version   |
| ------------------------------------------------ | --------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | >= 4.67.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                                               | Type        |
| -------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_cloudwatch_metric_alarm.high_cpu_system](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource    |
| [aws_cloudwatch_metric_alarm.high_cpu_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm)   | resource    |
| [aws_cloudwatch_metric_alarm.high_disk](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm)       | resource    |
| [aws_msk_broker_nodes.broker_nodes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/msk_broker_nodes)               | data source |
| [aws_msk_cluster.target_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/msk_cluster)                       | data source |

## Inputs

| Name                                                                                                         | Description                             | Type           | Default | Required |
| ------------------------------------------------------------------------------------------------------------ | --------------------------------------- | -------------- | ------- | :------: |
| <a name="input_aws_sns_topics_arns"></a> [aws_sns_topics_arns](#input_aws_sns_topics_arns)                   | List of ARNs for the SNS topics         | `list(string)` | `[]`    |    no    |
| <a name="input_cluster_name"></a> [cluster_name](#input_cluster_name)                                        | The name of the MSK cluster             | `string`       | `null`  |    no    |
| <a name="input_high_cpu_system_enabled"></a> [high_cpu_system_enabled](#input_high_cpu_system_enabled)       | Enable high CPU system alarm            | `bool`         | `true`  |    no    |
| <a name="input_high_cpu_system_threshold"></a> [high_cpu_system_threshold](#input_high_cpu_system_threshold) | The threshold for high CPU system usage | `number`       | `90`    |    no    |
| <a name="input_high_cpu_user_enabled"></a> [high_cpu_user_enabled](#input_high_cpu_user_enabled)             | Enable high CPU user alarm              | `bool`         | `true`  |    no    |
| <a name="input_high_cpu_user_threshold"></a> [high_cpu_user_threshold](#input_high_cpu_user_threshold)       | The threshold for high CPU user usage   | `number`       | `90`    |    no    |
| <a name="input_high_disk_enabled"></a> [high_disk_enabled](#input_high_disk_enabled)                         | Enable high disk alarm                  | `bool`         | `true`  |    no    |
| <a name="input_high_disk_threshold"></a> [high_disk_threshold](#input_high_disk_threshold)                   | The threshold for high disk usage       | `number`       | `85`    |    no    |
| <a name="input_tags"></a> [tags](#input_tags)                                                                | Tags to apply to the resources          | `map(string)`  | `{}`    |    no    |

## Outputs

No outputs.

<!-- END_TF_DOCS -->
