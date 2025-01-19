# provision network security group when needed to be used in the virtual network that needs to be secure from the internet
# this is a simple example of a network security group that allows SSH traffic to the virtual network
# the network security group is created in the same resource group as the virtual network and is standard to keep your resources secure. 
# the code block below only allows SSH traffic to the virtual network to come inbound. If not outbound is needed this configuration keeps the resource(s) more secure. 

resource "azurerm_network_security_group" "nsg" {
  name                = "silo17_nsg"
  location            = "CentralUS"
  resource_group_name = "silo17_rg"

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
  
}
