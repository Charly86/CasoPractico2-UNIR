# Creamos una máquina virtual para master y NFS
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine

resource "azurerm_linux_virtual_machine" "myVMMasterNFS" {
    name                = "vm-${var.vms_master_NFS[count.index]}"
    computer_name       = "vm-${var.vms_master_NFS[count.index]}-cvillar.unir"  # hostname para la maquina que se utiliza en el inventario de ansible
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    size                = var.vm_size_master  # Tamaño de las maquinas
    count               = length(var.vms_master_NFS)
    admin_username      = var.ssh_user
    network_interface_ids = [ azurerm_network_interface.myMasterNFSNic[count.index].id ]
    disable_password_authentication = true

    admin_ssh_key {
        username   = var.ssh_user
        public_key = file(var.public_key_path)
    }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    plan {
        name      = "centos-8-stream-free"
        product   = "centos-8-stream-free"
        publisher = "cognosys"
    }

    source_image_reference {
        publisher = "cognosys"
        offer     = "centos-8-stream-free"
        sku       = "centos-8-stream-free"
        version   = "1.2019.0810"
    }

    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.stAccount.primary_blob_endpoint
    }

    tags = {
        environment = "CP2"
    }

}

# Creamos una máquina virtual para workers
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine

resource "azurerm_linux_virtual_machine" "myVMWorkers" {
    name                = "vm-${var.vms_workers[count.index]}"
    computer_name       = "vm-${var.vms_workers[count.index]}-cvillar.unir"  # hostname para la maquina que se utiliza en el inventario de ansible
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    size                = var.vm_size_workers  # Tamaño de las maquinas
    count               = length(var.vms_workers)
    admin_username      = var.ssh_user
    network_interface_ids = [ azurerm_network_interface.myWorkersNic[count.index].id ]
    disable_password_authentication = true

    admin_ssh_key {
        username   = var.ssh_user
        public_key = file(var.public_key_path)
    }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    plan {
        name      = "centos-8-stream-free"
        product   = "centos-8-stream-free"
        publisher = "cognosys"
    }

    source_image_reference {
        publisher = "cognosys"
        offer     = "centos-8-stream-free"
        sku       = "centos-8-stream-free"
        version   = "1.2019.0810"
    }

    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.stAccount.primary_blob_endpoint
    }

    tags = {
        environment = "CP2"
    }

}