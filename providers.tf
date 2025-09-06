terraform {
  required_version = ">= 1.6.0"
  required_providers {
    kubernetes = { source = "hashicorp/kubernetes", version = "~> 2.33" }
    helm       = { source = "hashicorp/helm",       version = "~> 2.13" }
    github     = { source = "integrations/github",  version = "~> 6.3" }
    flux       = { source = "fluxcd/flux",          version = "~> 1.5" }
    # provider tehcyx/kind підтягується модулем kind, окремо оголошувати не потрібно
  }
}

# --- Змінна для явної вказівки kubeconfig (необов'язково) ---
# Якщо не задавати, провайдери візьмуть ~/.kube/config
variable "kubeconfig_path" {
  description = "Path to kubeconfig used by kubernetes/helm providers"
  type        = string
  default     = ""
}

# --- GitHub provider ---
# Токен читається з env GITHUB_TOKEN (рекомендовано), тому параметр token можна не ставити.
provider "github" {
  owner = var.github_owner
  # token = var.github_token   # Можеш розкоментувати, якщо хочеш явно передавати через TF_VAR_github_token
}

# --- Kubernetes provider ---
# Не посилаємось на module.kind_cluster.* у провайдерах (це заборонено).
# Використовуємо var.kubeconfig_path або ~/.kube/config за замовчуванням.
provider "kubernetes" {
  config_path       = var.kubeconfig_path != "" ? var.kubeconfig_path : pathexpand("~/.kube/config")
}

# --- Helm provider (на базі того ж kubeconfig) ---
provider "helm" {
  kubernetes {
    config_path       = var.kubeconfig_path != "" ? var.kubeconfig_path : pathexpand("~/.kube/config")
  }
}
