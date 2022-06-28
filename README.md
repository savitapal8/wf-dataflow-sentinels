# Sentinel Policies
Sentinel Policies are rules which are enforced on Terraform runs to validate that the plan and corresponding resources are in compliance with company policies.

# Policies and Policy Sets
Policies are written using the Sentinel language. Policies are the guardrails that prevent Terraform runs from performing dangerous actions. Upon evaluation, policies will adhere to a predefined enforcement level.

Policies are managed as parts of versioned policy sets, which allow individual policy files to be stored in a supported VCS provider or uploaded via the Terraform Cloud API.

---
**NOTE** 
It's also possible to manage policies and policy sets individually. However, this is a deprecated feature in Terraform Cloud, and we recommend always using versioned policy sets to manage policies.
---
Policy sets are groups of policies that can be enforced on workspaces. A policy set can be enforced on designated workspaces, or to all workspaces in the organization.

After the plan stage of a Terraform run, Terraform Cloud checks every Sentinel policy that should be enforced on the run's workspace. This includes policies from global policy sets, and from any policy sets that are explicitly assigned to the workspace.


# List Of Policies

Sentinel File | SED Policy ID |
---|---|
assetmgmt_gcp_naming_validation.sentinel  | GCP_RES_ID | 
encryption_gcp_cmek_enforce.sentinel  | GCP_RES_CMEK | 
tagging_gcp_validation.sentinel  | GCP_RES_LABELS | 
google_pubsub_topic.sentinel  | --- | 
google_secret_manager_secret.sentinel  | --- | 
google_compute_interconnect_attachment.sentinel | --- | 

## Pre Requistes 
Below are pre-requistes 
* `sentinel`
* `python3`


## Testing a Policy

```
sentinel test <sentinel file>
```
#####  Example: 
```
$ sentinel test encryption_gcp_cmek_enforce.sentinel
  PASS - encryption_gcp_cmek_enforce.sentinel
  PASS - test/encryption_gcp_cmek_enforce/google_dataproc_cluster_fail.hcl
  PASS - test/encryption_gcp_cmek_enforce/google_dataproc_cluster_null.hcl
  PASS - test/encryption_gcp_cmek_enforce/google_dataproc_cluster_pass.hcl
  PASS - test/encryption_gcp_cmek_enforce/google_pubsub_topic_fail.hcl
  PASS - test/encryption_gcp_cmek_enforce/google_pubsub_topic_null.hcl
  PASS - test/encryption_gcp_cmek_enforce/google_pubsub_topic_pass.hcl
  PASS - test/encryption_gcp_cmek_enforce/google_secret_manager_secret_fail.hcl
  PASS - test/encryption_gcp_cmek_enforce/google_secret_manager_secret_null.hcl
  PASS - test/encryption_gcp_cmek_enforce/google_secret_manager_secret_pass.hcl
```

## Testing all Policies

```
python3 scripts/test_policies.py  --sentinel_bin sentinel --sentinel_policy_dir ./policies
```

##### Sample Output


```
python3 scripts/test_policies.py  --sentinel_bin sentinel --sentinel_policy_dir ./policies

################### START ###################

sentinel test google_pubsub_topic.sentinel
PASS - google_pubsub_topic.sentinel

  PASS - test/google_pubsub_topic/cmek-pass.hcl

  PASS - test/google_pubsub_topic/fail.hcl

  PASS - test/google_pubsub_topic/null.hcl

sentinel test google_compute_interconnect_attachment.sentinel
PASS - google_compute_interconnect_attachment.sentinel

  PASS - test/google_compute_interconnect_attachment/fail.hcl

  PASS - test/google_compute_interconnect_attachment/pass.hcl

sentinel test tagging_gcp_validation.sentinel
PASS - tagging_gcp_validation.sentinel

  PASS - test/tagging_gcp_validation/fail.hcl

  PASS - test/tagging_gcp_validation/null.hcl

  PASS - test/tagging_gcp_validation/pass.hcl

sentinel test google_secret_manager_secret.sentinel
PASS - google_secret_manager_secret.sentinel

  PASS - test/google_secret_manager_secret/fail.hcl

  PASS - test/google_secret_manager_secret/pass.hcl

sentinel test encryption_gcp_cmek_enforce.sentinel
PASS - encryption_gcp_cmek_enforce.sentinel

  PASS - test/encryption_gcp_cmek_enforce/google_dataproc_cluster_fail.hcl

  PASS - test/encryption_gcp_cmek_enforce/google_dataproc_cluster_null.hcl

  PASS - test/encryption_gcp_cmek_enforce/google_dataproc_cluster_pass.hcl

  PASS - test/encryption_gcp_cmek_enforce/google_pubsub_topic_fail.hcl

  PASS - test/encryption_gcp_cmek_enforce/google_pubsub_topic_null.hcl

  PASS - test/encryption_gcp_cmek_enforce/google_pubsub_topic_pass.hcl

  PASS - test/encryption_gcp_cmek_enforce/google_secret_manager_secret_fail.hcl

  PASS - test/encryption_gcp_cmek_enforce/google_secret_manager_secret_null.hcl

  PASS - test/encryption_gcp_cmek_enforce/google_secret_manager_secret_pass.hcl

sentinel test test.sentinel
? - test.sentinel [no test files]

sentinel test assetmgmt_gcp_naming_validation.sentinel
PASS - assetmgmt_gcp_naming_validation.sentinel

  PASS - test/assetmgmt_gcp_naming_validation/fail.hcl

  PASS - test/assetmgmt_gcp_naming_validation/pass.hcl


################### RESULT ###################

All Sentinel tests have passed Successfully.
```