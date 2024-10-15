resource "kubernetes_namespace" "argocd" {
  metadata {
    name = var.argocd_release_namespace
  }
}

resource "helm_release" "argocd" {
  atomic           = true
  name             = var.argocd_release_name
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  create_namespace = false
  namespace        = kubernetes_namespace.argocd.metadata.0.name
  values = [templatefile("${path.root}/environments/${var.environment}/argo-cd/values.yml", {
    github_app_id              = var.github_app_id
    github_app_installation_id = var.github_app_installation_id
    github_app_private_key     = indent(8, var.github_app_private_key)
    environment                = var.environment
  })]
  wait          = true
  wait_for_jobs = true
}
