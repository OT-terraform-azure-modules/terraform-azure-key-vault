locals {
  tenant_id = coalesce(
    var.tenant_id,
    data.azurerm_client_config.config.tenant_id,
  )
}
