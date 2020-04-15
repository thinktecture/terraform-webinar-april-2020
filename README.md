# Terraform Webinar - April 2020

This repository contains the demonstration infrastructure - which was coded during the webinar - targeting *Microsoft Azure*.

In order to deploy the infrastructure to your Azure environment, ensure that you have an authentication context established. You can either

- Authenticate in Azure CLI (`az login`) and select your favorite subscription (`az account list` & `az account set --subscription <SUB_ID>`) for further information see [https://www.terraform.io/docs/providers/azurerm/guides/azure_cli.html](Authenticating Azure Provider using Azure CLI)
- Set dedicated Service Principal credentials (id and secret [or certificate]) usign environment variables as described at [https://www.terraform.io/docs/providers/azurerm/guides/service_principal_client_secret.html](Authenticating Azure Provider using Service Principal)
- Configure Terraform to use underlying MSI (if you run terraform on Azure Services supporting MSIs) as described at [https://www.terraform.io/docs/providers/azurerm/guides/managed_service_identity.html](Authenticating Azure Provider using MSI)

## Install Terraform

You can install Terraform either by downloading it from the [https://www.terraform.io/downloads.html](official website) or by installing it using the Terraform Version Manger (`tfenv`). See dedicated [https://github.com/tfutils/tfenv#installation](installation instructions for tfenv).

## Execution

Navigate in any given environment folder (`development`, `staging` or `production`). Once there, you have to initialize the project (once) by invoking 

```bash
terraform init

```

### Explicitly plan

Terraform can produce an Execution Plan to show you what whill happen when you `apply` the project. To get the execution plan, execute

```bash
terraform plan

```

### Apply project

You can apply the project to your Azure Subscription using `apply`:

```bash
terraform apply

```

if you don't want to approve the exeuction plan explicitly, you can append the `-auto-approve` flag

### Destroy the infrastructure

You can delete/destroy the infrastructure using `terraform destroy`.