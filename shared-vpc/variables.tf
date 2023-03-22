variable "host_project_id" {
}

variable "service_project_id_1" {
  type = string
}

# variable "service_project_id_2" {
#   type = string
# }

variable "vpc_name" {
  type = string
}


# variable "network_attributes" {
#   type = list(object({
#     name          = string
#     region        = string
#     zone          = string
#     ip_cidr_range = string
#     secondary_ip = list(object({
#       range_name    = string
#       ip_cidr_range = string
#     }))
#   }))
#   description = "Structure for the config variable"
# }

variable "self_link" {
description = "Self link"
 }