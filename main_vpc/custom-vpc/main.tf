#Resource block for VPC network
resource "google_compute_network" "vpc-network" {
  project                 = var.project_id
  name                    = var.vpc_name
  routing_mode            = var.routing_mode
  auto_create_subnetworks = false
}

#Resource block for subnetwork and secondary ip ranges
resource "google_compute_subnetwork" "vpc-subnetwork" {
  project = var.project_id
  network = google_compute_network.vpc-network.name
  #obj is initialised with the keys of the variable attributes
  for_each      = { for obj in var.network_attributes : obj.name => obj }
  region        = each.value.region
#   zone          = each.value.zone
  name          = each.value.name
  ip_cidr_range = each.value.ip_cidr_range
  #dynamic block is used for creation of multiple secondary ip ranges in a subnet 
  dynamic "secondary_ip_range" {
    for_each = each.value.secondary_ip
    /* for_each = {for val in var.secondary-ip : val.range_name => val } */
    content {
      ip_cidr_range = secondary_ip_range.value.ip_cidr_range
      range_name    = secondary_ip_range.value.range_name
    }
  }
  #depends on is for sequencing the creation of the resource for rejcting errors created due to absence of resources
  depends_on = [
    google_compute_network.vpc-network
  ]
}

resource "google_compute_firewall" "firewall_allow_ssh" {
  name        = var.firewall_rule_name
  description = "Allow SSH traffic to any instance tagged with 'ssh-enabled'"
  network     = google_compute_network.vpc-network.name
  direction   = var.firewall_direction

  allow {
    protocol = var.protocol
    ports    = var.ports
  }

  source_ranges = var.source_ranges
  target_tags   = var.target_tags
  project       = var.project_id
}
