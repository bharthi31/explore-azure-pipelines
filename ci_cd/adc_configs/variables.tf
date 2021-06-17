variable "traffic_split_percentage" {
  description = "Percentage of Traffic to be split"
  type        = number
  default     = 100
}
variable "backend_service_ip" {
  description = "The backend service IP"
  type        = string
  default     = "20.0.0.7"
}
variable "resource_prefix" {
  description = "Prefix of resources to be created"
  type = string
  default = "demo"
}
variable "lb_ip" {
  description = "IP of LB Vserver"
  type = string
  default = "1.1.1.1"
}
variable "priority" {
  description = "CS Policy Priority"
  type = number
  default = 100
}
