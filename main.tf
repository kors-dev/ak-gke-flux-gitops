########################################
# main.tf — kind + Flux bootstrap (SSH)
# prerequisites:
#   - providers.tf з required_providers (kubernetes, helm, flux, github, tls)
#   - variables.tf з:
#       cluster_name, github_owner, gitops_repo, gitops_branch, flux_namespace
#   - GH_TOKEN експортуй або залогінься gh-cli (для створення Deploy Key)
########################################

locals {
  name = var.cluster_name
}

# -------------------------------
# 1) Локальний кластер KIND
# -------------------------------
module "kind_cluster" {
  source = "github.com/den-vasyliev/tf-kind-cluster"
  name   = "${local.name}-kind"
}

# Провайдери підключаються до створеного KIND (через outputs модуля)
provider "kubernetes" {
  host                   = module.kind_cluster.endpoint
  client_certificate     = base64decode(module.kind_cluster.client_certificate)
  client_key             = base64decode(module.kind_cluster.client_key)
  cluster_ca_certificate = base64decode(module.kind_cluster.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = module.kind_cluster.endpoint
    client_certificate     = base64decode(module.kind_cluster.client_certificate)
    client_key             = base64decode(module.kind_cluster.client_key)
    cluster_ca_certificate = base64decode(module.kind_cluster.cluster_ca_certificate)
  }
}

# Альтернатива (залежно від модуля KIND): якщо є kubeconfig_path
# provider "kubernetes" { config_path = module.kind_cluster.kubeconfig_path }
# provider "helm" { kubernetes { config_path = module.kind_cluster.kubeconfig_path } }

# -------------------------------
# 2) SSH-ключ для Flux (модуль TLS)
# -------------------------------
module "flux_keys" {
  source = "github.com/den-vasyliev/tf-hashicorp-tls-keys"
  name   = "${local.name}-flux-gitops"
}

# -------------------------------
# 3) Deploy Key (write) у GitHub-репозиторій GitOps
#    Flux читатиме YAML із ЦЬОГО ж репозиторію по SSH
# -------------------------------
resource "github_repository_deploy_key" "flux" {
  repository = var.gitops_repo                 # напр. "ak-gke-flux-gitops"
  title      = "flux-deploy-key"
  key        = module.flux_keys.public_key_openssh
  read_only  = false                           # write=true ок для bootstrap/оновлень
}

# -------------------------------
# 4) Bootstrap Flux у кластер
# -------------------------------
module "flux_bootstrap" {
  source          = "github.com/den-vasyliev/tf-fluxcd-flux-bootstrap"
  namespace       = var.flux_namespace         # зазвичай "flux-system"

  # Flux синхронізується з цим же репо по SSH
  git_repo_url    = "git@github.com:${var.github_owner}/${var.gitops_repo}.git"
  git_branch      = var.gitops_branch          # "main"
  private_key_pem = module.flux_keys.private_key_pem

  # гарантуємо, що Deploy Key вже створений
  depends_on = [
    github_repository_deploy_key.flux,
    module.kind_cluster
  ]
}

# Після apply Flux підхопить ваші маніфести з цього репозиторію (apps/*),
# зокрема apps/kbot/{gitrepository.yaml,helmrelease.yaml}, якщо вони закомічені.
