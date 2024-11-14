resource "aws_cloudwatch_metric_alarm" "high_disk" {
  count                     = var.high_disk_enabled ? 1 : 0
  alarm_name                = "${var.msk_brocker_id}-high-disk"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "KafkaDataLogsDiskUsed"
  namespace                 = "AWS/Kafka"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = var.high_disk_threshold
  alarm_description         = "MSK Broker Disk usage IN ${var.msk_brocker_id} is too high"
  insufficient_data_actions = []
  alarm_actions             = [var.aws_sns_topic_arn]
  ok_actions                = [var.aws_sns_topic_arn]
  dimensions = {
    "Cluster Name" = var.cluster_name
    "Broker ID"    = var.msk_brocker_id
  }

  tags = merge(var.tags, {
    "BrockerID" = var.msk_brocker_id,
    "Terraform" = "true"
  })
}


resource "aws_cloudwatch_metric_alarm" "high_cpu_user" {
  count                     = var.high_cpu_user_enabled ? 1 : 0
  alarm_name                = "${var.msk_brocker_id}-high-cpu-user"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CpuUser"
  namespace                 = "AWS/Kafka"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = var.high_cpu_user_threshold
  alarm_description         = "MSK Broker CPU USER usage IN ${var.msk_brocker_id} is too high"
  insufficient_data_actions = []
  alarm_actions             = [var.aws_sns_topic_arn]
  ok_actions                = [var.aws_sns_topic_arn]
  dimensions = {
    "Cluster Name" = var.cluster_name
    "Broker ID"    = var.msk_brocker_id
  }

  tags = merge(var.tags, {
    "BrockerID" = var.msk_brocker_id,
    "Terraform" = "true"
  })
}
resource "aws_cloudwatch_metric_alarm" "high_cpu_system" {
  count                     = var.high_cpu_system_enabled ? 1 : 0
  alarm_name                = "${var.msk_brocker_id}-high-cpu-system"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CpuSystem"
  namespace                 = "AWS/Kafka"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = var.high_cpu_system_threshold
  alarm_description         = "MSK Broker CPU System usage IN ${var.msk_brocker_id} is too high"
  insufficient_data_actions = []
  alarm_actions             = [var.aws_sns_topic_arn]
  ok_actions                = [var.aws_sns_topic_arn]
  dimensions = {
    "Cluster Name" = var.cluster_name
    "Broker ID"    = var.msk_brocker_id
  }

  tags = merge(var.tags, {
    "BrockerID" = var.msk_brocker_id,
    "Terraform" = "true"
  })
}
