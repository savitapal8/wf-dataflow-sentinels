policy "google_composer_environment.sentinel" {
    source = "./google_composer_environment.sentinel"
    enforcement_level = "hard-mandatory"
}

module "tfplan-functions" {
  source = "../../../common-functions/tfplan-functions/tfplan-functions.sentinel"
}

module "generic-functions" {
    source = "../../../common-functions/generic-functions/generic-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "./gce-rbac-fail.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}