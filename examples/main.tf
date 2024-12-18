provider "aws" {
  region = "eu-west-1"
}

resource "aws_sns_topic" "opsgenie_topic" {
  name         = "opsgenie"
  display_name = "opsgenie"
}

resource "aws_sns_topic_subscription" "opsgenie_subscription" {
  confirmation_timeout_in_minutes = 1
  endpoint_auto_confirms          = false
  topic_arn                       = aws_sns_topic.opsgenie_topic.arn
  protocol                        = "https"
  endpoint                        = "https://api.opsgenie.com/v1/xxx"
  depends_on                      = [aws_sns_topic.opsgenie_topic]
}

module "msk_alarms" {
  source                 = "delivops/msk-alerts/aws"
  cluster_name           = "your-cluster-name"
  high_disk_threshold    = 85
  global_sns_topics_arns = [aws_sns_topic.sns_topic.arn]
  tags = {
    Environment = "production"
  }
}


