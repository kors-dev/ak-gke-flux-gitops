# OCIRepository з твоїх tfvars
resource "kubectl_manifest" "kbot_oci_repo" {
  yaml_body = <<-YAML
    apiVersion: source.toolkit.fluxcd.io/v1
    kind: OCIRepository
    metadata:
      name: app-kbot
      namespace: ${var.flux_namespace}
    spec:
      interval: 1m
      url: ${var.oci_chart_url}
      ref:
        semver: "${var.oci_chart_semver}"
  YAML

  # Дочекайся Flux (оператор+інстанс) перед джерелом
  depends_on = [helm_release.flux_instance]
}

# HelmRelease, що посилається на OCIRepository (chartRef)
resource "kubectl_manifest" "kbot_helmrelease" {
  yaml_body = <<-YAML
    apiVersion: helm.toolkit.fluxcd.io/v2
    kind: HelmRelease
    metadata:
      name: app-kbot
      namespace: ${var.flux_namespace}
    spec:
      interval: 1m
      releaseName: app-kbot
      targetNamespace: default
      chartRef:
        kind: OCIRepository
        name: app-kbot
        namespace: ${var.flux_namespace}
      values:
        image:
          repository: ghcr.io/kors-dev/kbot
          tag: v2.2.3-938957b-linux-amd64
        # Прокидуємо секрет з токеном у контейнер:
        extraEnvFrom:
          - secretRef:
              name: kbot
  YAML

  depends_on = [kubectl_manifest.kbot_oci_repo]
}
