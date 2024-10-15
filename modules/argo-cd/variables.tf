variable "environment" {
  description = "The environment to deploy to"
  type        = string
  default     = "dev"
}

variable "argocd_release_name" {
  description = "The name of the ArgoCD Helm release"
  type        = string
  default     = "argocd"

  validation {
    condition     = length(var.argocd_release_name) < 53
    error_message = "The ArgoCD Helm release name must not exceed DNS-1123 subdomain length of 53 characters"
  }

}

variable "argocd_release_namespace" {
  description = "The namespace of the ArgoCD Helm release"
  type        = string
  default     = "argocd"
}

variable "image_pull_policy" {
  description = "The image pull policy to use for the ArgoCD and Argo Rollouts Helm releases"
  type        = string
  default     = "IfNotPresent"
}

variable "github_app_id" {
  description = "GitHub App ID."
  type        = string
  sensitive   = true
}

variable "github_app_installation_id" {
  description = "GitHub App installation ID."
  type        = string
  sensitive   = true
}

variable "github_app_private_key" {
  description = "GitHub App private key."
  type        = string
  sensitive   = true
}
