variable "location"       { type = string }
variable "resource_group" { type = string }
variable "tags"           { type = map(string) default = {} }

variable "apps" {
  description = "Mapa de apps a serem criados neste ambiente"
  type = map(object({
    plan_name     = string        # nome do App Service Plan
    plan_sku      = string        # ex: B1, P1v3
    plan_os       = string        # Linux ou Windows
    app_name      = string        # nome do Web App
    runtime_stack = string        # ex: NODE|18-lts, DOTNETCORE:8.0
    app_settings  = optional(map(string), {})
  }))
  default = {}
}
