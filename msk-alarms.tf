resource "aws_cloudwatch_metric_alarm" "high_disk" {
  for_each                  = var.high_disk_enabled ? toset(local.broker_ids) : toset([])
  alarm_name                = "MSK | High Disk (>${var.high_disk_threshold}%) | ${var.cluster_name}/${each.value}"
  alarm_description         = "High Disk in cluster ${var.cluster_name} broker ${each.value}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 5
  datapoints_to_alarm       = 5
  period                    = 360
  metric_name               = "KafkaDataLogsDiskUsed"
  namespace                 = "AWS/Kafka"
  statistic                 = "Average"
  threshold                 = var.high_disk_threshold
  treat_missing_data        = "breaching"
  alarm_actions             = concat(var.high_disk_sns_topics_arns, var.global_sns_topics_arns)
  ok_actions                = concat(var.high_disk_sns_topics_arns, var.global_sns_topics_arns)
  insufficient_data_actions = concat(var.high_disk_sns_topics_arns, var.global_sns_topics_arns)

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
  alarm_name                = "MSK | High CPU User (>${var.high_cpu_user_threshold}%) | ${var.cluster_name}/${each.value}"
  alarm_description         = "High CPU User in cluster ${var.cluster_name} broker ${each.value}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 5
  datapoints_to_alarm       = 5
  period                    = 360
  metric_name               = "CpuUser"
  namespace                 = "AWS/Kafka"
  statistic                 = "Average"
  threshold                 = var.high_cpu_user_threshold
  treat_missing_data        = "breaching"
  alarm_actions             = concat(var.high_cpu_user_sns_topics_arns, var.global_sns_topics_arns)
  ok_actions                = concat(var.high_cpu_user_sns_topics_arns, var.global_sns_topics_arns)
  insufficient_data_actions = concat(var.high_cpu_user_sns_topics_arns, var.global_sns_topics_arns)

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
  alarm_name                = "MSK | High CPU System (>${var.high_cpu_system_threshold}%) | ${var.cluster_name}/${each.value}"
  alarm_description         = "High CPU System in cluster ${var.cluster_name} broker ${each.value}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 5
  datapoints_to_alarm       = 5
  period                    = 360
  metric_name               = "CpuSystem"
  namespace                 = "AWS/Kafka"
  statistic                 = "Average"
  threshold                 = var.high_cpu_system_threshold
  treat_missing_data        = "breaching"
  alarm_actions             = concat(var.high_cpu_system_sns_topics_arns, var.global_sns_topics_arns)
  ok_actions                = concat(var.high_cpu_system_sns_topics_arns, var.global_sns_topics_arns)
  insufficient_data_actions = concat(var.high_cpu_system_sns_topics_arns, var.global_sns_topics_arns)

  dimensions = {
    "Cluster Name" = var.cluster_name
    "Broker ID"    = each.value
  }

  tags = merge(var.tags, {
    "BrockerID" = each.value,
    "Terraform" = "true"
  })
}






