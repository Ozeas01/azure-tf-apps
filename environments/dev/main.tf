# Resource Group do ambiente
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group
  location = var.location
  tags     = var.tags
}

# Storage do ambiente (opcional – pode deixar para depois)
# module "storage" {
#   source              = "../../modules/storage_account"
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = var.location
#   name_prefix         = "appstd"
# }

module "webapps" {
  for_each            = var.apps                         
  source              = "../../modules/app_service"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  plan_name     = each.value.plan_name
  plan_sku      = each.value.plan_sku
  plan_os       = each.value.plan_os
  app_name      = each.value.app_name
  runtime_stack = each.value.runtime_stack
  app_settings  = lookup(each.value, "app_settings", {})
}

# Saída: hostname de cada app
output "apps_urls" {
  value = { for k, m in module.webapps : k => m.default_hostname }
}
