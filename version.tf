terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = ">= 3.70.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }

}