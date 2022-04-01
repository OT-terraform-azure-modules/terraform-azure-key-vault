resource "azurerm_role_assignment" "rbac_keyvault_custom" {
  for_each = toset(var.rbac_authorization_enabled ? var.custom_objects_ids : [])

  scope                = azurerm_key_vault.key_vault.id
  role_definition_name = var.role_definition_name
  principal_id         = each.value
}


resource "azurerm_role_assignment" "rbac_keyvault_administrator" {
  for_each = toset(var.rbac_authorization_enabled ? var.admin_objects_ids : [])

  scope                = azurerm_key_vault.key_vault.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "rbac_keyvault_secrets_users" {
  for_each = toset(var.rbac_authorization_enabled ? var.reader_objects_ids : [])

  scope                = azurerm_key_vault.key_vault.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "rbac_keyvault_reader" {
  for_each = toset(var.rbac_authorization_enabled ? var.reader_objects_ids : [])

  scope                = azurerm_key_vault.key_vault.id
  role_definition_name = "Key Vault Reader"
  principal_id         = each.value
}
