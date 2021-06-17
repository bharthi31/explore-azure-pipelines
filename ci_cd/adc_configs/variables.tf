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
variable "lbvs_name" {
  description = "Name of LB Vserver"
  type = string
  default = "lbvs"
}
variable "lb_ip" {
  description = "IP of LB Vserver"
  type = string
  default = "1.1.1.1"
}
variable "cspolicy_name" {
  description = "Name of CS Policy"
  type = string
  default = "cspolicy"
}
variable "backend_service_name" {
  description = "backend service name"
  type = string
  default = "service"
}
variable "priority" {
  description = "CS Policy Priority"
  type = number
  default = 100
}
