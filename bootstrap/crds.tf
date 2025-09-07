locals {
  gateway_api_version = "v1.2.0"
}

data "http" "gateway_api_crds" {
  url = "https://github.com/kubernetes-sigs/gateway-api/releases/download/${local.gateway_api_version}/standard-install.yaml"
}

# Розбиваємо multi-doc YAML на окремі документи
data "kubectl_file_documents" "gateway_api" {
  content = data.http.gateway_api_crds.response_body
}

# Застосовуємо КОЖЕН документ окремим ресурсом
resource "kubectl_manifest" "gateway_api_crds" {
  for_each  = { for i, doc in data.kubectl_file_documents.gateway_api.documents : i => doc }
  yaml_body = each.value
}