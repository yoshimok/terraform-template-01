variable "subscription_id" {
  type        = "string"
  description = "Subscription ID to create an Automation account"
}

variable "sp_tenant_id" {
  type        = "string"
  description = "Tenant ID to create an Automation account"
}

variable "sp_client_id" {
  type        = "string"
  description = "Service principal Application ID"
}

variable "sp_client_secret" {
  type        = "string"
  description = "Service principal Secret"
}