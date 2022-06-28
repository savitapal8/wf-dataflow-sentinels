module "tfplan-functions" {
  source = "../../../common-functions/tfplan-functions/tfplan-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-skip-null.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}