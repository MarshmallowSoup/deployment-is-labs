output "argo_rollouts_release_status" {
  value = helm_release.argo-rollouts.status
}

output "argo_rollouts_release_name" {
  value = helm_release.argo-rollouts.metadata.0.name
}

output "argo_rollouts_release_namespace" {
  value = helm_release.argo-rollouts.metadata.0.namespace
}

output "argo_rollouts_version" {
  value = helm_release.argo-rollouts.metadata.0.app_version
}

output "argo_rollouts_release_version" {
  value = helm_release.argo-rollouts.metadata.0.version
}