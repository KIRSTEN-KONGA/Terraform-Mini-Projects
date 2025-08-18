locals {
  Vnet_Peering = {
    peering1 = {
      source = "Vnet1"
      target = "Vnet2"
    }
    peering2 = {
      source = "Vnet2"
      target = "Vnet1"
    }

  }
}