variable "name" {
  description = "(Required) Vault name must only contain alphanumeric characters and dashes and cannot start with a number."
  type        = string
  default     = ""
}

variable "location" {
  description = "Azure location for Key Vault."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "(Required) Resource Group the resources will belong to"
  type        = string
  default     = ""
}

variable "enabled_for_deployment" {
  description = "(Optional) To specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault."
  type        = bool
  default     = false
}

variable "enabled_for_disk_encryption" {
  description = "(Optional) To specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
  type        = bool
  default     = false
}

variable "enabled_for_template_deployment" {
  description = "(Optional) To specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault."
  type        = bool
  default     = false
}

variable "sku_name" {
  description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium."
  type        = string
  default     = "standard"
}

variable "purge_protection_enabled" {
  description = "Whether to activate purge protection"
  type        = bool
  default     = true
}

variable "soft_delete_retention_days" {
  type        = number
  description = "Specifies the number of days for soft delete retention."
  default     = 8
  validation {
    condition     = var.soft_delete_retention_days > 6 && var.soft_delete_retention_days < 91
    error_message = "Soft delete retention days can be configured to between 7 to 90 days."
  }
}

variable "network_acls" {
  description = "Object with attributes: `bypass`, `default_action`, `ip_rules`, `virtual_network_subnet_ids`. "
  default = null


  type = object({
    bypass                     = string,
    default_action             = string,
    ip_rules                   = list(string),
    virtual_network_subnet_ids = list(string),
  })
}
#--------------------------For Role based Authentication & Policy access-----------------------------------------------
variable "rbac_authorization_enabled" {
  type        = bool
  description = "(Required) To specify whether Azure Key Vault uses Role Based Access Control (RBAC) for authorization of data actions instead of access policies."
  default     = false
}

variable "role_definition_name" {
  description = "Enter the name of the role which you want to assign"
  type        = string
  default     = "Log Analytics Reader"
}

variable "admin_objects_ids" {
  description = "Ids of the objects that can do all operations on all keys, secrets and certificates"
  type        = list(string)
  default     = []
}

variable "reader_objects_ids" {
  description = "Ids of the objects that can read all keys, secrets and certificates"
  type        = list(string)
  default     = []
}



#------------------------------------------------For custom policy-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
variable "custom_objects_ids" {
  description = "Ids of the objects would have custom permissions on keys, secrets and certificates"
  type        = list(string)
  default     = []
}

variable "custom_key_permissions" {
  description = "(Optional) List of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify and WrapKey."
  type        = list(string)
  default     = []
}

variable "custom_secret_permissions" {
  description = "(Optional) List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set."
  type        = list(string)
  default     = []
}

variable "custom_certificate_permissions" {
  description = "(Optional) List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update"
  type        = list(string)
  default     = []
}

#-------------------------------------------Tags--------------------------------------------------------------
variable "tags" {
  type = map(string)
  default = {
    Name        = "testing"
    environment = "prod"
  }
  description = "(Optional) Tag which will associated to Azure key vault."
}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID that should be used for authenticating requests to the Key Vault. Default is the current one."
  type        = string
  default     = ""
}