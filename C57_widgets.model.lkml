connection: "falcon"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: new_business_state_totals {}

explore: claims_activity_detail {}

explore: in_force_vehicle_count_information {}

explore: in_force_policy_count_information {}

explore: average_severity_for_paid_claim {}
