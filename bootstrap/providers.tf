locals {
  kubeconfig_path = coalesce(var.kubeconfig_path, "${path.module}/kubeconfig")
}

provider "kubernetes" {
  config_path = local.kubeconfig_path
}

provider "helm" {
  kubernetes {
    config_path = local.kubeconfig_path
  }
}
provider "kubectl" {
  config_path = local.kubeconfig_path
}
