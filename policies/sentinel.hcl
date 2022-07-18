module "tfplan-functions" {
    source = "../common-functions/tfplan-functions/tfplan-functions.sentinel"
}

module "tfstate-functions" {
    source = "../common-functions/tfstate-functions/tfstate-functions.sentinel"
}

module "tfconfig-functions" {
    source = "../common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}

module "generic-functions" {
    source = "../common-functions/generic-functions/generic-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "../sentinel-mocks/mock-tfplan-v2.sentinel"
  }
}

mock "tfconfig/v2" {
  module {
    source = "../sentinel-mocks/mock-tfconfig-v2.sentinel"
  }
}

policy "appsec_gcp_serviceaccount_restriction" {
    source = "./appsec_gcp_serviceaccount_restriction.sentinel"
    enforcement_level = "advisory"
}

policy "network_gcp_ip_restriction" {
    source = "./network_gcp_ip_restriction.sentinel"
    enforcement_level = "advisory"
}

policy "assetmgmt_gcp_naming_validation" {
    source = "./assetmgmt_gcp_naming_validation.sentinel"
    enforcement_level = "advisory"
}

policy "threat_gcp_unapproved_service_validation" {
    source = "./threat_gcp_unapproved_service_validation.sentinel"
    enforcement_level = "advisory"
}

policy "compute_gcp_versioning_enforce" {
    source = "./compute_gcp_versioning_enforce.sentinel"
    enforcement_level = "advisory"
}

policy "encryption_gcp_cmek_enforce" {
    source = "./encryption_gcp_cmek_enforce.sentinel"
    enforcement_level = "advisory"
}

policy "iam_gcp_identity_enforce" {
    source = "./iam_gcp_identity_enforce.sentinel"
    enforcement_level = "advisory"
}

param "org" {
  value = [ "wf" ]
}

param "country" {
  value = [ "us" ]
}

param "gcp_region" {
  value = [ "US" ]
}

param "owner" {
  value = ["hybridenv"] 
}

param "application_division" {
  value =  ["pci", "paa", "hdpa", "hra", "others"]
}

param "application_name" {
  value =  ["app1","demo"]
}

param "application_role" {
  value = ["app", "web", "auth", "data"]
}

param "environment" {
  value =   ["prod", "nonprod", "sandbox", "core"] 
}

param "au" {
  value = [ "0223092" ]
}

param "prefix" {
    value = "us-"
}