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