
locals {
  default_tags = {
    app         = "Terraform Webinar"
    responsible = "Thorsten Hans"
  }

  all_tags = merge(local.default_tags, var.tags)
}

resource "azurerm_resource_group" "rg_webinar" {
  name     = "rg-webinar-${var.environment_name}"
  location = var.location
  tags     = local.all_tags
}

resource "azurerm_application_insights" "ai_webinar" {
  resource_group_name = azurerm_resource_group.rg_webinar.name
  location            = azurerm_resource_group.rg_webinar.location
  name                = "ai-webinar-${var.environment_name}"
  application_type    = "web"
  tags                = local.all_tags
}

resource "azurerm_app_service_plan" "asp_webinar" {
  resource_group_name = azurerm_resource_group.rg_webinar.name
  location            = azurerm_resource_group.rg_webinar.location
  name                = "asp-webinar-${var.environment_name}"
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Standard"
    size = var.asp_size
  }
  tags = local.all_tags
}

resource "azurerm_app_service" "as_webinar" {
  resource_group_name = azurerm_resource_group.rg_webinar.name
  location            = azurerm_resource_group.rg_webinar.location
  name                = "as-webinar-${var.environment_name}"
  app_service_plan_id = azurerm_app_service_plan.asp_webinar.id
  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.ai_webinar.instrumentation_key
  }

  site_config {
    always_on        = true
    linux_fx_version = "DOCKER|nginx:latest"
  }

  tags = local.all_tags
}
