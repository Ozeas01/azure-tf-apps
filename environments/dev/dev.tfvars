location       = "brazilsouth"
resource_group = "rg-demo-dev"
tags = { env = "dev", owner = "plataforma" }

# Cada chave (site1, site2, ...) e so um identificador
apps = {
  site1 = {
    plan_name     = "plan-dev-site1"
    plan_sku      = "B1"
    plan_os       = "Linux"
    app_name      = "webapp-dev-site1"
    runtime_stack = "NODE|18-lts"
    app_settings  = { ASPNETCORE_ENVIRONMENT = "Development" }
  }
