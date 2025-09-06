########################################
# main.tf — kind + Flux bootstrap (SSH)
# prerequisites:
#   - providers.tf з required_providers (kubernetes, helm, flux, github, tls)
#   - variables.tf з:
#       cluster_name, github_owner, gitops_repo, gitops_branch, flux_namespace
#   - GH_TOKEN експортуй або залогінься gh-cli (для створення Deploy Key)
########################################

#locals {
#  name = var.cluster_name
#}

# -------------------------------
# 1) Локальний кластер KIND
# -------------------------------
module "kind_cluster" {
  source = "github.com/den-vasyliev/tf-kind-cluster"
}

# -------------------------------
# 2) SSH-ключ для Flux (модуль TLS)
# -------------------------------
module "flux_keys" {
  source = "github.com/den-vasyliev/tf-hashicorp-tls-keys"
  # опційно (за замовчуванням і так ECDSA P256):
  # algorithm   = "ECDSA"
  # ecdsa_curve = "P256"
}

# -------------------------------
# 3) Deploy Key (write) у GitHub-репозиторій GitOps
#    Flux читатиме YAML із ЦЬОГО ж репозиторію по SSH
# -------------------------------
#resource "github_repository_deploy_key" "flux" {
#  repository = var.gitops_repo                 # напр. "ak-gke-flux-gitops"
#  title      = "flux-deploy-key"
#  key        = module.flux_keys.public_key_openssh
#  read_only  = false                           # write=true ок для bootstrap/оновлень
#}

# -------------------------------
# 4) Bootstrap Flux у кластер
# -------------------------------
module "flux_bootstrap" {
  source            = "github.com/den-vasyliev/tf-fluxcd-flux-bootstrap"

  # owner/repo, з яким працюватиме Flux
  github_repository = "${var.github_owner}/${var.gitops_repo}"

  # PAT із правами repo (подаємо через TF_VAR_github_token або var)
  github_token      = var.github_token

  # SSH приватний ключ (з модуля tls-keys), обов'язково
  private_key       = module.flux_keys.private_key_pem

  # kubeconfig для доступу до кластера, один з варіантів нижче:
  # 1) якщо модуль kind віддає шлях:
  config_path       = var.kubeconfig_path != "" ? var.kubeconfig_path : pathexpand("~/.kube/config")
  # 2) як fallback, якщо попередній рядок не проходить — закоментуй його і розкоментуй це:
  # config_path     = pathexpand("~/.kube/config")
}

# Після apply Flux підхопить ваші маніфести з цього репозиторію (apps/*),
# зокрема apps/kbot/{gitrepository.yaml,helmrelease.yaml}, якщо вони закомічені.
