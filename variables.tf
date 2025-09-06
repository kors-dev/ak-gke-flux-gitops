variable "cluster_name" {
  type = string
  default = "gitops-lab" 
}
variable "github_owner" {
  type = string 
} # "kors-dev"
variable "gitops_repo" {
  type = string
  default = "ak-gke-flux-gitops" 
}
variable "gitops_branch" {
  type = string
  default = "main" 
}
variable "flux_namespace" { 
  type = string
  default = "flux-system" 
}
variable "github_token" {
  description = "GitHub token used by the fluxcd/flux provider"
  type        = string
  sensitive   = true
}