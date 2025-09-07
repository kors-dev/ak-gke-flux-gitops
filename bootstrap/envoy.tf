resource "helm_release" "envoy_gateway" {
  depends_on       = [kind_cluster.this, kubectl_manifest.gateway_api_crds]
  name             = "eg"
  namespace        = var.envoy_namespace
  repository       = "oci://docker.io/envoyproxy"
  chart            = "gateway-helm"
  version          = var.envoy_chart_version
  create_namespace = true
}