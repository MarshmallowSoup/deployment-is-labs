output "argocd_release_status" {
  value = helm_release.argocd.status
}

output "argocd_release_name" {
  value = helm_release.argocd.metadata.0.name
}

output "argocd_release_namespace" {
  value = helm_release.argocd.metadata.0.namespace
}

output "argocd_version" {
  value = helm_release.argocd.metadata.0.app_version
}

output "argocd_release_version" {
  value = helm_release.argocd.metadata.0.version
}
