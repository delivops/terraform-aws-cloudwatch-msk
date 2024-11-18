resource "aws_cloudwatch_metric_alarm" "high_disk" {
  for_each                  = toset(local.broker_ids) * var.high_disk_enabled ? 1 : 0
  alarm_name                = "${var.cluster_name}-broker-${each.value}-high-disk"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "KafkaDataLogsDiskUsed"
  namespace                 = "AWS/Kafka"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = var.high_disk_threshold
  alarm_description         = "MSK Broker ${each.value} disk usage in cluster ${var.cluster_name} is too high"
  insufficient_data_actions = []
  alarm_actions             = [var.aws_sns_topic_arn]
  ok_actions                = [var.aws_sns_topic_arn]
  dimensions = {
    "Cluster Name" = var.cluster_name
    "Broker ID"    = each.value
  }

  tags = merge(var.tags, {
    "BrokerID"  = each.value,
    "Terraform" = "true"
  })
}

resource "aws_cloudwatch_metric_alarm" "high_cpu_user" {
  for_each                  = toset(local.broker_ids) * var.high_cpu_user_enabled ? 1 : 0
  alarm_name                = "${var.cluster_name}-broker-${each.value}-high-cpu-user"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CpuUser"
  namespace                 = "AWS/Kafka"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = var.high_cpu_user_threshold
  alarm_description         = "MSK Broker ${each.value} CPU USER usage in ${var.cluster_name} is too high"
  insufficient_data_actions = []
  alarm_actions             = [var.aws_sns_topic_arn]
  ok_actions                = [var.aws_sns_topic_arn]
  dimensions = {
    "Cluster Name" = var.cluster_name
    "Broker ID"    = each.value
  }

  tags = merge(var.tags, {
    "BrockerID" = each.value,
    "Terraform" = "true"
  })
}
resource "aws_cloudwatch_metric_alarm" "high_cpu_system" {
  for_each                  = toset(local.broker_ids) * var.high_cpu_system_enabled ? 1 : 0
  alarm_name                = "${var.cluster_name}-broker-${each.value}-high-cpu-system"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CpuSystem"
  namespace                 = "AWS/Kafka"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = var.high_cpu_system_threshold
  alarm_description         = "MSK Broker ${each.value} CPU SYSTEM usage in ${var.cluster_name} is too high"
  insufficient_data_actions = []
  alarm_actions             = [var.aws_sns_topic_arn]
  ok_actions                = [var.aws_sns_topic_arn]
  dimensions = {
    "Cluster Name" = var.cluster_name
    "Broker ID"    = each.value
  }

  tags = merge(var.tags, {
    "BrockerID" = each.value,
    "Terraform" = "true"
  })
}






