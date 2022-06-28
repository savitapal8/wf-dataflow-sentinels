module "tfplan-functions" {
  source = "../../../common-functions/tfplan-functions/tfplan-functions.sentinel"
}

module "tfconfig-functions" {
  source = "../../../common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}

module "generic-functions" {
    source = "../../../common-functions/generic-functions/generic-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "./mock-tfplan-gdc-cc-sa-null.sentinel"
  }
}


mock "tfconfig/v2" {
  module {
    source = "./mock-tfconfig-gdc-cc-sa-null.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
