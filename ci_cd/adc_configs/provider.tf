terraform {
  backend "local" {
  }
  required_providers {
    citrixadc = {
      source = "citrix/citrixadc"
      version = "1.0.1"
    }
  }
}

provider "citrixadc" {
  endpoint = "http://172.16.0.4"
  username = "nsroot"
  password = "nsroot@12345"
}
