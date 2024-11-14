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
