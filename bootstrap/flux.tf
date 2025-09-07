resource "helm_release" "flux_operator" {
  depends_on       = [kind_cluster.this]
  name             = "flux-operator"
  namespace        = var.flux_namespace
  repository       = "oci://ghcr.io/controlplaneio-fluxcd/charts"
  chart            = "flux-operator"
  create_namespace = true
}

resource "helm_release" "flux_instance" {
  depends_on = [helm_release.flux_operator]
  name       = "flux-instance"
  namespace  = var.flux_namespace
  repository = "oci://ghcr.io/controlplaneio-fluxcd/charts"
  chart      = "flux-instance"

  set {
    name  = "distribution.version"
    value = var.flux_distribution
  }
}
