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

### Interacting with the Application

Use the following commands to interact with the deployed application:

## Create an item:


curl -X POST -H "Content-Type: application/json" -d '{"name": "shadrach"}' http://<IP address>/items

## Retrieve an item:


curl http://<IP address>/items

## Outputs

![AKS Dashboard](https://github.com/shadrachdoc/AKS-python-deployment/blob/main/k8s/Azure-screenshot.png)
![Application](https://github.com/shadrachdoc/AKS-python-deployment/blob/main/k8s/python-output.png)
![Github Action](https://github.com/shadrachdoc/AKS-python-deployment/blob/main/k8s/github-action.png)


  
