variable "location"       { type = string }
variable "resource_group" { type = string }
variable "tags"           { type = map(string) default = {} }

# variable "apps" {
#   type = map(object({
#     plan_name     = string
#     plan_sku      = string
#     plan_os       = string
#     app_name      = string
#     runtime_stack = string
#     app_settings  = optional(map(string), {})
#   }))
#   default = {}
# }
