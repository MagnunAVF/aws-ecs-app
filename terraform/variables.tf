variable "region" {
  type        = string
  description = "AWS region where resources will be provisioned."
}

variable "cluster_name" {
  type        = string
  description = "Name of the ECS cluster that will host the service."
}

variable "service_name" {
  type        = string
  description = "Name of the service to be used within the cluster."
}

variable "service_port" {
  type        = number
  description = "TCP port on which the service will accept traffic."
}

variable "service_cpu" {
  type        = number
  description = "Amount of CPU reserved for the service, in units defined by AWS."
}

variable "service_memory" {
  type        = number
  description = "Amount of memory reserved for the service, in megabytes."
}

variable "service_healthcheck" {
  type        = map(any)
  description = "Health check configurations for the service, such as path and protocol."
}

variable "service_launch_type" {
  type        = string
  description = "Launch type of the service in ECS, can be 'FARGATE' or 'EC2'."
}

variable "service_hosts" {
  type        = list(string)
  description = "List of addresses or host names assigned to the service for load balancing or exposure."
}

variable "service_task_count" {
  type        = number
  description = "Number of tasks that the service should keep running simultaneously."
}

variable "ssm_vpc_id" {
  type        = string
  description = "VPC ID stored in AWS Systems Manager (SSM) where the service will be deployed."
}

variable "ssm_listener" {
  type        = string
  description = "ARN of an Application Load Balancer (ALB) listener, stored in AWS SSM, that will be used by the service."
}

variable "ssm_private_subnet_1" {
  type        = string
  description = "ID of the first private subnet, stored in AWS SSM, where the service will be deployed."
}

variable "ssm_private_subnet_2" {
  type        = string
  description = "ID of the second private subnet, stored in AWS SSM, for service deployment."
}

variable "ssm_private_subnet_3" {
  type        = string
  description = "ID of the third private subnet, stored in AWS SSM, used for service deployment."
}

variable "environment_variables" {
  type        = list(map(string))
  description = "List of environment variables that will be passed to the service tasks."
}

variable "capabilities" {
  type        = list(string)
  description = "List of special capabilities required for the service, such as 'SYS_ADMIN' for certain system privileges."
}

variable "scale_type" {
  type        = string
  description = "Type of scalability, such as 'cpu', 'cpu_tracking' or 'requests_tracking'."
}

variable "task_minimum" {
  type        = number
  description = "Minimum number of tasks that should be run by the service."
}

variable "task_maximum" {
  type        = number
  description = "Maximum number of tasks that can be run by the service."
}

variable "scale_out_cpu_threshold" {
  type        = number
  description = "CPU utilization threshold value that, when exceeded, triggers a scale-out action, in percentage."
}

variable "scale_out_adjustment" {
  type        = number
  description = "Number of tasks to add during a scale-out action."
}

variable "scale_out_comparison_operator" {
  type        = string
  description = "Comparison operator used for the scale-out condition, such as 'GreaterThanOrEqualToThreshold'."
}

variable "scale_out_statistic" {
  type        = string
  description = "Statistic used for the scale-out condition, such as 'Average' or 'Sum'."
}

variable "scale_out_period" {
  type        = number
  description = "Duration of the evaluation period for scale-out, in seconds."
}

variable "scale_out_evaluation_periods" {
  type        = number
  description = "Number of evaluation periods required to trigger a scale-out action."
}

variable "scale_out_cooldown" {
  type        = number
  description = "Cooldown period after a scale-out action, in seconds."
}

variable "scale_in_cpu_threshold" {
  type        = number
  description = "CPU utilization threshold value that, when below, triggers a scale-in action, in percentage."
}

variable "scale_in_adjustment" {
  type        = number
  description = "Number of tasks to reduce during a scale-in action."
}

variable "scale_in_comparison_operator" {
  type        = string
  description = "Comparison operator used for the scale-in condition, such as 'LessThanOrEqualToThreshold'."
}

variable "scale_in_statistic" {
  type        = string
  description = "Statistic used for the scale-in condition, such as 'Average' or 'Sum'."
}

variable "scale_in_period" {
  type        = number
  description = "Duration of the evaluation period for scale-in, in seconds."
}

variable "scale_in_evaluation_periods" {
  type        = number
  description = "Number of evaluation periods required to trigger a scale-in action."
}

variable "scale_in_cooldown" {
  type        = number
  description = "Cooldown period after a scale-in action, in seconds."
}