module "custom-vpc" {
  source             = "./custom-vpc"
  vpc_name           = var.vpc_name
  project_id         = var.project_id
  network_attributes = var.network_attributes
  routing_mode       = var.routing_mode
  firewall_rule_name = var.firewall_rule_name
  firewall_direction = var.firewall_direction
  protocol           = var.protocol
  ports              = var.ports
  source_ranges      = var.source_ranges
  target_tags        = var.target_tags
}

module "shared-vpc" {
    source = "./shared-vpc"
    host_project_id= var.host_project_id
    service_project_id_1= var.service_project_id_1
    #service_project_id_2= var.service_project_id_2
    vpc_name= var.vpc_name
    # subnet_name= var.subnet_name
    # subnet_region= var.subnet_region
    self_link             = module.custom-vpc.link

depends_on = [
  module.custom-vpc
]
}