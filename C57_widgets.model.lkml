connection: "falcon-test"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: c57_new_business_state_totals {label: "New Business State Totals"}

explore: c57_claims_activity_detail {
  label: "Claims Activity Detail"

  join: claim_control {
    fields: []
    type: inner
    sql_on: ${c57_claims_activity_detail.claimcontrol_id} = ${claim_control.claimcontrol_id} ;;
    relationship: many_to_many
  }

  join: policy_image {
    fields: []
    type: inner
    sql_on: ${claim_control.policy_id} = ${policy_image.policy_id} ;;
    relationship: many_to_many
  }

  join: policy_image_address_link {
    fields: []
    type:  inner
    sql_on: ${policy_image.policy_id} = ${policy_image_address_link.policy_id} AND ${policy_image.policyimage_num} = ${policy_image_address_link.policyimage_num} ;;
    relationship: one_to_many
  }

  join: policy_address {
    view_label: "Claims Activity Detail"
    fields: [zip]
    type:  inner
    sql_on:  ${policy_image_address_link.address_id} = ${policy_address.address_id};;
    relationship: one_to_one
  }

  }

explore: c57_in_force_vehicle_count_information {
  label: "In-Force Vehicle Count Information"

  join: active_coverages {
    view_label: ""
    fields: [dscr]
    type: inner
    sql_on: ${c57_in_force_vehicle_count_information.coveragecode_id} = ${active_coverages.coveragecode_id} ;;
    relationship: one_to_one
  }

  }

explore: c57_in_force_policy_count_information {label: "In-Force Policy Count and Premium Information"}

explore: c57_loss_expense_ratio_by_coverage {label: "Loss Expense Ratio by Coverage"}

explore: c57_average_severity_for_paid_claim {
  label: "Average Severity For Paid Claims"

  join: claim_control {
    fields: []
    type: inner
    sql_on: ${c57_average_severity_for_paid_claim.claimcontrol_id} = ${claim_control.claimcontrol_id} ;;
    relationship: many_to_many
  }

  join: policy_image {
    fields: []
    type: inner
    sql_on: ${claim_control.policy_id} = ${policy_image.policy_id} ;;
    relationship: many_to_many
  }

  join: policy_image_address_link {
    fields: []
    type:  inner
    sql_on: ${policy_image.policy_id} = ${policy_image_address_link.policy_id} AND ${policy_image.policyimage_num} = ${policy_image_address_link.policyimage_num} ;;
    relationship: one_to_many
  }

  join: policy_address {
    view_label: "Average Severity For Paid Claims"
    fields: [zip]
    type:  inner
    sql_on:  ${policy_image_address_link.address_id} = ${policy_address.address_id};;
    relationship: one_to_one
  }

  join: state {
    view_label: "Average Severity For Paid Claims"
    type:  inner
    sql_on: ${policy_address.state_id} = ${state.state_id} ;;
    relationship:  one_to_one
  }

  }
