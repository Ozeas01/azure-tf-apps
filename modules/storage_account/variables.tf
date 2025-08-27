variable "resource_group_name" { type = string }
variable "location"            { type = string }
variable "name_prefix"         { type = string }
variable "kind"                { type = string default = "StorageV2" }
variable "sku"                 { type = string default = "Standard_LRS" }
