terraform {
  required_version = ">= 1.3.0"

  required_providers {
    cloudfoundry = {
      source  = "cloudfoundry-community/cloudfoundry"
      version = ">= 0.50.5"
    }
    hsdp = {
      source  = "philips-software/hsdp"
      version = ">= 0.42.1"
    }
    random = {
      source  = "random"
      version = ">= 3.4.3"
    }
  }
}
