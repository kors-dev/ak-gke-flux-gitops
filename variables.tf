variable "cluster_name"    { type = string, default = "gitops-lab" }
variable "github_owner"    { type = string } # напр. "kors-dev"
variable "gitops_repo"     { type = string, default = "ak-gke-flux-gitops" }
variable "gitops_branch"   { type = string, default = "main" }
variable "flux_namespace"  { type = string, default = "flux-system" }
