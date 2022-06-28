module "tfplan-functions" {
  source = "../../../common-functions/tfplan-functions/tfplan-functions.sentinel"
}

module "generic-functions" {
    source = "../../../common-functions/generic-functions/generic-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-google_secret_manager_secret-fail.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}