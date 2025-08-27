variable "resource_group_name" { type = string }
variable "location"            { type = string }
variable "plan_name"           { type = string }
variable "plan_sku"            { type = string }
variable "plan_os"             { type = string } # "Linux" ou "Windows"
variable "app_name"            { type = string }
variable "runtime_stack"       { type = string } 
variable "app_settings"        { type = map(string) default = {} }
