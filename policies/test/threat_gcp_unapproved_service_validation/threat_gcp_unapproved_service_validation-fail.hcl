module "tfplan-functions" {
    source = "../../../common-functions/tfplan-functions/tfplan-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "./threat_gcp_unapproved_service_validation-fail.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}