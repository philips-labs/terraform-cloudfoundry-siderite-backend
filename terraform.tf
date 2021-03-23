terraform {
  required_version = ">= 0.13.0"

  required_providers {
    cloudfoundry = {
      source  = "philips-labs/cloudfoundry"
      version = ">= 0.1300.0"
    }
    hsdp = {
      source  = "philips-software/hsdp"
      version = ">= 0.13.1"
    }
    random = {
      source  = "random"
      version = ">= 2.2.1"
    }
  }
}
