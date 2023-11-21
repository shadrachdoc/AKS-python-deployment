# Azure GitHub Actions Pipeline Setup Guide

This guide provides step-by-step instructions to set up and execute a GitHub Actions pipeline for deploying an application on Azure Kubernetes Service (AKS).

## Prerequisites

Before running the pipeline, ensure you have the necessary credentials and variables set up:

### GitHub Action Secrets

Configure the following secrets in your GitHub repository:
- `AZURE_CLIENT_ID`
- `AZURE_CLIENT_SECRET`
- `AZURE_SUBSCRIPTION_ID`
- `AZURE_TENANT_ID`
- `SECRET_AZURE_CRE`
- `SECRET_USERNAME` (Dockerhub login)
- `SECRET_PASS` (Dockerhub password)

### GitHub Variables
Set the following GitHub variables:
- `AKS_CLUSTER_NAME`
- `RESOURCE_GROUP`

## Service Principal Setup

1. Create a service principal using the following Azure CLI command, and note down the generated Client ID and secrets:
   
   ```bash
   az ad sp create-for-rbac --name "githubactions" --role contributor --scopes /subscriptions/595cde91-1448-4867-beca-c97b439bbc31/resourceGroups/test_env --sdk-auth
2. Assign the required roles to the service principal using the following commands:
   
   ```bash
   az role assignment create --assignee <principalId> --role "Azure Kubernetes Service Cluster User Role" --scope 
   /subscriptions/subscriptions ID/resourceGroups/<resource-groupname>
   
   
   az role assignment create --assignee <principalId> --role "Contributor" --scope /subscriptions/subscriptions 
   ID/resourceGroups/<resource-groupname>
    
   
   az role assignment create --assignee <principalId> --role "Azure Kubernetes Service Contributor Role" --scope 
   /subscriptions/subscriptions ID/resourceGroups/<resource-groupname>

   
   az role assignment create --assignee <principalId> --role "Kubernetes Extension Contributor" --scope 
   /subscriptions/subscriptions ID/resourceGroups/<resource-groupname>

   
   az role assignment create --assignee <principalId> --role "Owner" --scope /subscriptions/subscriptions 
   ID/resourceGroups/<resource-groupname>


   ### Application Deployment

1) After deploying the application, verify its status using the following command:

   ```bash
   kubectl get svc

## Console Output:

![github action console output](https://github.com/shadrachdoc/AKS-python-deployment/blob/main/screenshots/console-output.png)

## Browser output

![Browser output](https://github.com/shadrachdoc/AKS-python-deployment/blob/main/screenshots/browser-output.png)
browser-output.png

### Interacting with the Application

Use the following commands to interact with the deployed application:

## In CLI

curl http://IP-address

## In Browser

http://IP-address

# Deployment

This application is currently deployed to Kubernetes using raw YAML manifests. 

## Future Enhancements

For easier management and deployment, we could incorporate a packaging tool like Kustomize or Helm.

### Kustomize

Kustomize lets you customize raw Kubernetes YAMLs for multiple environments like dev, test, prod by applying config overlays and partials. This keeps base manifests intact while letting teams tweak deployments.

Some ways we could use Kustomize:

- Set names, namespaces, replicas per environment
- Add/modify resources like ingress, services, configs  
- Parameterize full YAML blocks for customization


### Helm

Helm provides package management for Kubernetes using shareable charts. Charts encapsulate all YAML, config and scripts needed to install an application.

Benefits of Helm:

- No need to write raw YAML, reduce duplication
- Package management capabilities like versioning and releasing
- Handle complex deployments with ease
- Share charts publicly or privately across teams


Using Kustomize or Helm would simplify and standardize deployments to any environment. We could incorporate as the application grows more complex.

## Outputs

![Github Action](https://github.com/shadrachdoc/AKS-python-deployment/blob/main/screenshots/github-action.png)






  
