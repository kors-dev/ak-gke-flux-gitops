variable "cluster_name" {
  type        = string
  default     = "k8sdiy"
  description = "Назва кластера KinD"
}

variable "kubeconfig_path" {
  type        = string
  default     = null
  nullable    = true
  description = "Шлях до kubeconfig; якщо null — збережеться в ./bootstrap/kubeconfig"
}

variable "flux_namespace" {
  type        = string
  default     = "flux-system"
  description = "Неймспейс для Flux Operator/Instance"
}

variable "flux_distribution" {
  type        = string
  default     = "=2.5.x"
  description = "Версія Flux distribution (напр., =2.5.x)"
}

variable "envoy_namespace" {
  type        = string
  default     = "envoy-gateway-system"
  description = "Неймспейс для Envoy Gateway"
}

variable "envoy_chart_version" {
  type        = string
  default     = "v1.3.2"
  description = "Версія чарта Envoy Gateway"
}

# Якщо вирішиш керувати 'release' через Flux CRD у YAML поза Terraform —
# ці змінні можуть не знадобитися. Тримай тут про всяк випадок.
variable "oci_chart_url" {
  type        = string
  default     = "oci://ghcr.io/den-vasyliev/charts/kbot"
  description = "OCI-URL Helm-чарта застосунку"
}

variable "oci_chart_semver" {
  type        = string
  default     = ">2.2.0"
  description = "SemVer-діапазон для релізу"
}
