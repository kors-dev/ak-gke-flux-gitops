terraform {
  required_version = ">= 1.6.0"
  required_providers {
    kubernetes = { source = "hashicorp/kubernetes", version = "~> 2.33" }
    helm       = { source = "hashicorp/helm",       version = "~> 2.13" }
    flux       = { source = "fluxcd/flux",          version = "~> 1.3" }
    github     = { source = "integrations/github",  version = "~> 6.3" }
    tls        = { source = "hashicorp/tls",        version = "~> 4.0" }
  }
}

# Провайдери kubernetes/helm будуть ініціалізовані після створення kind (через outputs)
# github: потрібен, щоб додати deploy key до цього ж репозиторію
provider "github" {
  owner = var.github_owner
  # auth через GH_TOKEN в env (export GH_TOKEN=....) або через gh auth login
}
