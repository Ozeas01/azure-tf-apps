# 1) Resource Group do ambiente
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group
  location = var.location
  tags     = var.tags
}

# 2) Storage (via módulo)
module "storage" {
  source              = "../../modules/storage_account"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  name_prefix = "appstd"         # regra de nome padronizada
  # sku = "Standard_LRS"         # (opcional) override
  # kind = "StorageV2"           # (opcional) override
}

# 3) App Service (via módulo)
module "webapp" {
  source              = "../../modules/app_service"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  plan_name     = "plan-dev-main"
  plan_sku      = "B1"
  plan_os       = "Linux"
  app_name      = "webapp-dev-main"
  runtime_stack = "NODE|18-lts"  # exemplo de stack

  app_settings = {
    "ASPNETCORE_ENVIRONMENT"         = "Development"
    "AZURE_STORAGE_CONNECTION_STRING"= module.storage.primary_connection_string
  }
}

# 4) Saídas úteis
output "web_url"         { value = module.webapp.default_hostname }
output "storage_account" { value = module.storage.name }
