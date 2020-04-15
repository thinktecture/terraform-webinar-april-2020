# GitHub Actions for Terraform Sample

This folder contains an example which shows how to use `terraform` in GitHub Actions. If you want to use it in your GitHub repository, you have to place the file in a `.github/workflows/` folder in your repository.

Additionally, four secrets must be configured in your repository (see repository settings page).

The following secrets must be specified


`SERVICE_PRINCIPAL_ID`: The id of the Service Principal used to authenticate
`SERVICE_PRINCIPAL_SECRET`: The password of the Service Principal used to authenticate
`AZ_SUBSCRIPTION_ID`: The id of the Microsoft Azure Subscription
`AZ_TENANT_ID`: The id of the Microsoft Azure Tenant