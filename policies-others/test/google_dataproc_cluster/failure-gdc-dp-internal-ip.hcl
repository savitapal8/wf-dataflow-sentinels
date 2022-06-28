module "tfplan-functions" {
  source = "../../../common-functions/tfplan-functions/tfplan-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "./mock-tfplan-gdc-dp-internal-ip-failure.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
