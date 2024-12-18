variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {}
}

variable "all_alarms_sns_arns" {
  description = "List of ARNs for the SNS topics"
  type        = list(string)
  default     = []
}

variable "high_cpu_user_threshold" {
  description = "The threshold for high CPU user usage"
  type        = number
  default     = 90

}
variable "high_cpu_user_enabled" {
  description = "Enable high CPU user alarm"
  type        = bool
  default     = true

}
variable "high_cpu_user_sns_arns" {
  description = "List of ARNs for the SNS topics"
  type        = list(string)
  default     = []

}
variable "high_cpu_system_threshold" {
  description = "The threshold for high CPU system usage"
  type        = number
  default     = 90

}
variable "high_cpu_system_enabled" {
  description = "Enable high CPU system alarm"
  type        = bool
  default     = true

}
variable "high_cpu_system_sns_arns" {
  description = "List of ARNs for the SNS topics"
  type        = list(string)
  default     = []

}
variable "high_disk_enabled" {
  description = "Enable high disk alarm"
  type        = bool
  default     = true

}
variable "high_disk_threshold" {
  description = "The threshold for high disk usage"
  type        = number
  default     = 85

}
variable "high_disk_sns_arns" {
  description = "List of ARNs for the SNS topics"
  type        = list(string)
  default     = []

}
variable "cluster_name" {
  description = "The name of the MSK cluster"
  type        = string
  default     = null

}

