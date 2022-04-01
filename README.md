Azure Key Vault Terraform Module
=====================================

[![Opstree Solutions][opstree_avatar]][opstree_homepage]

[Opstree Solutions][opstree_homepage] 

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/150x150/https://github.com/opstree.png

- This terraform module will create a Key Vault.
- This project is a part of opstree's ot-azure initiative for terraform modules.


## Module Usage

```hcl
provider "azurerm" {
  features {}

}
terraform {
  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.99.0"
    }
  }
}



module "Key_vault" {
  source              = "../"
  name                = "my-keyvault-0079900"
  resource_group_name = "Automation-RG"
  

}
```

Inputs
------
 Name | Description | Type | Default | Required 
------|-------------|------|---------|:--------:
`name` |  The name of the Key Vault | `string` | "" | Yes 
`location` |  The location of the resource group in which resources are created | `string` | "" | No 
`resource_group_name` |  The name of the resource group in which resources are created | `string` | "" | Yes
`enabled_for_deployment` |  To specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. | `bool` | false | No
`enabled_for_disk_encryption` | To specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. | `bool` | false | No
`enabled_for_template_deployment` |  To specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. | `bool` | false | No
`sku_name` |  The Name of the SKU used for this Key Vault. Possible values are standard and premium | `string` | "standard" | No
`purge_protection_enabled` | Whether to activate purge protection | `bool` | true | No
`soft_delete_retention_days` |  Specifies the number of days for soft delete retention. | `number`| "" | No
`network_acls` |  Key Vault Network Rules |   `object` | null | No
`rbac_authorization_enabled` | Role Based Access Control (RBAC) for authorization of data actions | `bool` | false | No
`admin_objects_ids` | Ids of the objects that can do all operations on all keys, secrets and certificates | `list` | [] | No
`reader_objects_ids` | Ids of the objects that can read all keys, secrets and certificates | `list` | [] | No
`custom_objects_ids` | Ids of the objects would have custom permissions on keys, secrets and certificates | `list` | [] | No
`role_definition_name` | Enter the name of the role which you want to assign | `string` | "" | No
`custom_objects_ids` | Ids of the objects would have custom permissions on keys, secrets and certificates | `list` | [] | No
`custom_key_permissions` | List of key permissions, must be one or more from the following: Backup, Create, Decrypt, Delete, Encrypt, Get, Import, List, Purge, Recover, Restore, Sign, UnwrapKey, Update, Verify and WrapKey | `list` | [] | No
`custom_secret_permissions` | List of secret permissions, must be one or more from the following: Backup, Delete, Get, List, Purge, Recover, Restore and Set. | `list` | [] | No
`custom_certificate_permissions` | List of certificate permissions, must be one or more from the following: Backup, Create, Delete, DeleteIssuers, Get, GetIssuers, Import, List, ListIssuers, ManageContacts, ManageIssuers, Purge, Recover, Restore, SetIssuers and Update | `list` | [] | No
`tenant_id` | The Azure Active Directory tenant ID that should be used for authenticating requests to the Key Vault. Default is the current one. | `string` | "" | No
`tags` | A map of tags associated to Azure key vault | `map` | {} | No



## Outputs

Name | Description
---- | -----------
`key_vault_id`| The ID of the Key Vault
`key_vault_name`| The name of the Key Vault
`key_vault_uri`| URI of the Key Vault



### Contributors
|  [![Deepak Kumar][deepak_avatar]][deepak_homepage]<br/>[Deepak Kumar][deepak_homepage] |
|---|

[deepak_homepage]: https://gitlab.com/deepak.kumar34
[deepak_avatar]: https://gitlab.com/uploads/-/system/user/avatar/10842436/avatar.png?width=400
