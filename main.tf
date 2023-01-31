resource "google_compute_network" "my_network" {
  name    = var.vpc_name
  project = var.project
}

resource "google_compute_subnetwork" "my_subnet_1" {
  name          = var.subnetwork_name
  project       = var.project
  ip_cidr_range = "10.0.0.0/16"
  region        = var.region
  network       = google_compute_network.my_network.self_link
}

resource "google_container_cluster" "my_cluster" {
  name               = var.cluster_name
  location           = var.region
  initial_node_count = 1
  network            = google_compute_network.my_network.name
  project            = var.project
  

  addons_config {
    http_load_balancing {
      disabled = false
    }
  }

  node_config {
    oauth_scopes = ["https://www.googleapis.com/auth/compute", "https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring"]
    labels = {
      "cloud.google.com/gke-nodepool" = "default-pool"
    }
    machine_type = "n1-standard-1"
    metadata = {
      "disable-legacy-endpoints" = "true"
    }
    min_cpu_platform = "Intel Skylake"
  }

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes = true
  }

  ip_allocation_policy {
    cluster_ipv4_cidr_block = "10.0.0.0/16"
    services_ipv4_cidr_block = "10.1.0.0/16"
  }

  subnetwork = google_compute_subnetwork.my_subnet_1.self_link

  node_pool {
    name = "default-pool"
    initial_node_count = 3
    autoscaling {
      min_node_count = 1
      max_node_count = 8
    }
  }
}



