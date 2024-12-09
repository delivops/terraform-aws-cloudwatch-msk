resource "aws_cloudwatch_metric_alarm" "high_disk" {
  for_each                  = var.high_disk_enabled ? toset(local.broker_ids) : toset([])
  alarm_name                = "MSK | ${var.cluster_name}/${each.value} | High Disk"
  alarm_description         = "High Disk in cluster ${var.cluster_name} broker ${each.value}"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "KafkaDataLogsDiskUsed"
  namespace                 = "AWS/Kafka"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = var.high_disk_threshold
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
  for_each                  = var.high_cpu_user_enabled ? toset(local.broker_ids) : toset([])
  alarm_name                = "MSK | ${var.cluster_name}/${each.value} | High CPU User"
  alarm_description         = "High CPU User in cluster ${var.cluster_name} broker ${each.value}"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CpuUser"
  namespace                 = "AWS/Kafka"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = var.high_cpu_user_threshold
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
  for_each                  = var.high_cpu_system_enabled ? toset(local.broker_ids) : toset([])
  alarm_name                = "MSK | ${var.cluster_name}/${each.value} | High CPU System"
  alarm_description         = "High CPU System in cluster ${var.cluster_name} broker ${each.value}"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CpuSystem"
  namespace                 = "AWS/Kafka"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = var.high_cpu_system_threshold
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






