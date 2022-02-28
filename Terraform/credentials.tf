# crea un service principal y rellena los siguientes datos para autenticar
provider "azurerm" {
  features {}
   subscription_id = "edd8661f-2482-4fc3-bb09-aedf422d862d"
   client_id = "6a555d21-391f-4092-bafb-aeb93a68c637" 
   client_secret = "0A.es-LujHL-zHMPlToeO82kCk0owSrN98" 
   tenant_id = "899789dc-202f-44b4-8472-a6d40f9eb440"
}