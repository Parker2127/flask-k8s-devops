#Used to define where the state file is stored, in this case we are using azure blob storage to store the state file.

terraform {
    backend "azurerm"{
        resource_group_name="tfstate-rg"
        storage_account_name="tfstateshree"
        container_name="tfstate"
        key="flask-app.tfstate"
        #key is name of the state file inside the container(blob, folder)
    }
}