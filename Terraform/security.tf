# Security group master
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group

resource "azurerm_network_security_group" "mySecGroupMasterNFS" {
    name                = "sshtraffic-${var.vms_master[count.index]}"
    count               = length(var.vms_master)
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        environment = "CP2"
    }
}

# Vinculamos el security group al interface de red
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association

resource "azurerm_network_interface_security_group_association" "mySecGroupAssociationMasterNFS" {
    count                     = length(var.vms_master)
    network_interface_id      = azurerm_network_interface.myMasterNFSNic[count.index].id
    network_security_group_id = azurerm_network_security_group.mySecGroupMasterNFS[count.index].id
    

}


# Security group workers
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group

resource "azurerm_network_security_group" "mySecGroupWorkers" {
    name                = "sshtraffic-${var.vms_workers[count.index]}"
    count               = length(var.vms_workers)
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        environment = "CP2"
    }
}

# Vinculamos el security group al interface de red
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association

resource "azurerm_network_interface_security_group_association" "mySecGroupAssociationWorkers" {
    count                     = length(var.vms_workers)
    network_interface_id      = azurerm_network_interface.myWorkersNic[count.index].id
    network_security_group_id = azurerm_network_security_group.mySecGroupWorkers[count.index].id
    

}