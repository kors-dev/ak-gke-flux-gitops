terraform {
  required_version = ">= 1.6.0"

  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "~> 0.6"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.25"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.12"
    }
    kubectl = { 
      source = "gavinbunney/kubectl"
      version = ">= 1.14.0" 
    }
    http    = { 
      source = "hashicorp/http"
      version = ">= 3.4.0" 
    }
  }
}
