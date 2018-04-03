connection: "falcon"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: c57_new_business_state_totals {}

explore: c57_claims_activity_detail {}

explore: c57_in_force_vehicle_count_information {}

explore: c57_in_force_policy_count_information {}

explore: c57_average_severity_for_paid_claim {}
