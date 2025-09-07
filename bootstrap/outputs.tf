output "kubeconfig_path" {
  value       = local.kubeconfig_path
  description = "Де лежить kubeconfig, яким користуються провайдери"
}

output "flux_namespace" {
  value       = var.flux_namespace
  description = "Неймспейс Flux"
}

output "envoy_namespace" {
  value       = var.envoy_namespace
  description = "Неймспейс Envoy Gateway"
}
