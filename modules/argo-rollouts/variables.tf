variable "environment" {
  description = "The environment to deploy to"
  type        = string
  default     = "dev"

}

variable "argo_rollouts_release_name" {
  description = "The name of the Argo Rollouts Helm release"
  type        = string
  default     = "argo-rollouts"

  validation {
    condition     = length(var.argo_rollouts_release_name) < 53
    error_message = "The Argo Rollouts Helm release name must not exceed DNS-1123 subdomain length of 53 characters"
  }
}

variable "argo_rollouts_release_namespace" {
  description = "The namespace of the Argo Rollouts Helm release"
  type        = string
  default     = "argo-rollouts"
}

variable "image_pull_policy" {
  description = "The image pull policy to use for the ArgoCD and Argo Rollouts Helm releases"
  type        = string
  default     = "IfNotPresent"
}