# A host project provides network resources to associated service projects.
resource "google_compute_shared_vpc_host_project" "host" {
  project = var.host_project_id
}

# A service project gains access to network resources provided by its
# associated host project.
resource "google_compute_shared_vpc_service_project" "service1" {
  host_project    = google_compute_shared_vpc_host_project.host.project
  service_project = var.service_project_id_1
}

# resource "google_compute_shared_vpc_service_project" "service2" {
#   host_project    = google_compute_shared_vpc_host_project.host.project
#   service_project = var.service_project_id_2
# }

# Shared Network to attach 
data "google_compute_network" "vpc-network" {
  name    = var.vpc_name
  project = var.host_project_id
}


# Shared Sub-Networks to attach 
# data "google_compute_subnetwork" "vpc-subnetwork" {
#   #   name    = var.subnet_name
#   project = var.host_project_id
#   region = "us-central1"
#   network = var.self_link
#   #   region  = var.subnet_region
# #   network_attributes = var.network_attributes
# }
