terraform {
    required_version = ">= 1.0.0"
    # This is the required provider block for Terraform 0.13 and later
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~> 3.0"
        }
        argocd = {
            source = "argoproj-labs/argocd"
            version = "7.8.0"
        }
        kubernetes = {
            source = "hashicorp/kubernetes"
            version = "~> 2.0"
        }
        helm = {
            source = "hashicorp/helm"
            version = "~> 2.0"
        }
    }
}