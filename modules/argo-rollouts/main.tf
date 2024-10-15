resource "kubernetes_namespace" "argo-rollouts" {
  metadata {
    name = var.argo_rollouts_release_namespace
  }
}

resource "helm_release" "argo-rollouts" {
  atomic           = true
  name             = var.argo_rollouts_release_name
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-rollouts"
  create_namespace = false
  namespace        = kubernetes_namespace.argo-rollouts.metadata.0.name
  values           = [file("${path.root}/environments/${var.environment}/argo-rollouts/values.yml")]
  wait             = true
  wait_for_jobs    = true
}