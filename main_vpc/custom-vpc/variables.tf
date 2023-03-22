# variable definition for project id 
variable "project_id" {
  type        = string
  description = "The ID of the project where this VPC will be created"
}

# variable definition for vpc
# VPC name
variable "vpc_name" {}

# Variable definition for subnet
variable "network_attributes" {
  type = list(object({
    name          = string
    region        = string
    # zone          = string
    ip_cidr_range = string
    secondary_ip = list(object({
      range_name    = string
      ip_cidr_range = string
    }))
  }))
  description = "Structure for the config variable"
}


# variable "vpc_network" {
#   type = string
# }

variable "routing_mode" {
  type = string
}

# variable "subnet_name" {
#   type = string
# }

# variable "subnet_region" {
#   type = string
# }

variable "firewall_rule_name" {
  type = string
}

# variable "ip_cidr_range" {
#   type = string
# }

variable "target_tags" {
  #type = string
}

variable "firewall_direction" {
}

variable "protocol" {
}

variable "ports" {
}

variable "source_ranges" {
}
