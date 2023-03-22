output "link" {
  description = "A link to the VPC resource, useful for creating resources inside the VPC"
  value       = google_compute_network.vpc-network.self_link
}

output "network_name" {
  description = "The name of the VPC"
  value       = google_compute_network.vpc-network.name
}

output "id" {
  description = "id of the vpc"
  value = google_compute_network.vpc-network.id
  
}

# output "subnetwork_id" {
#   description = "the subnetwork id "
#   value = google_compute_subnetwork.vpc-subnetwork.name
  
# }

# output "subnetwork_name" {
#   value = google_compute_subnetwork.vpc-subnetwork.name
  
# }