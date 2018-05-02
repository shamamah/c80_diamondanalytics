connection: "falcon-test"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: policy {
  label: "Policy"
  join: policy_image {
    type: inner
    sql_on: ${policy.policy_id} = ${policy_image.policy_id} ;;
    relationship: one_to_many
  }

  join: policy_image_active {
    view_label: "Policy"
    type: inner
    sql_on: ${policy.policy_id} = ${policy_image_active.policy_id} and
      ${policy.activeimage_num} = ${policy_image_active.policyimage_num};;
    relationship: one_to_one
  }

  join: current_status {
    view_label: "Policy"
    type: inner
    sql_on: ${policy.policycurrentstatus_id} = ${current_status.policycurrentstatus_id} ;;
    relationship: one_to_one
  }

  join: billing_invoice {
    view_label: "Policy"
    type: inner
    sql_on: ${policy.policy_id} = ${billing_invoice.policy_id} ;;
    relationship: one_to_one
  }

  join: policy_image_trans_reason {
    view_label: "Policy Image"
    type: inner
    sql_on: ${policy_image.transreason_id} = ${policy_image_trans_reason.transreason_id} ;;
    relationship: one_to_one
  }

  join: policy_image_trans_type {
    view_label: "Policy Image"
    type: inner
    sql_on: ${policy_image.transtype_id} = ${policy_image_trans_type.transtype_id} ;;
    relationship: one_to_one
  }

  join: policy_status_code {
    view_label: "Policy Image"
    type: inner
    sql_on: ${policy_image.policystatuscode_id} = ${policy_status_code.policystatuscode_id} ;;
    relationship: one_to_one
  }

  join:  policy_level {
    view_label: "Policy Image"
    type:  inner
    relationship: many_to_many
    sql_on: ${policy_image.policy_id} = ${policy_level.policy_id}
      and ${policy_image.policyimage_num} = ${policy_level.policyimage_num};;
  }

  join: policy_underwriting {
    view_label: "Policy Image"
    type:  inner
    relationship: many_to_many
    fields: [policy_underwriting.underwriting_response]
    sql_on: ${policy_image.policy_id} = ${policy_underwriting.policy_id}
      and ${policy_image.policyimage_num} = ${policy_underwriting.policyimage_num};;
  }
  join:  policy_underwriting_code {
    view_label: "Policy Image"
    type:  inner
    fields: [policy_underwriting_code.underwriting_question]
    relationship: many_to_one
    sql_on: ${policy_underwriting.policyunderwritingcode_id} = ${policy_underwriting_code.policyunderwritingcode_id};;
  }

  join: version {
    type: inner
    sql_on: ${policy_image.version_id} = ${version.version_id} ;;
    relationship: many_to_one
  }

  join: company_state_lob {
    view_label: "Company"
    type: inner
    sql_on: ${version.companystatelob_id} = ${company_state_lob.companystatelob_id} ;;
    relationship: one_to_one
  }

  join: policy_holder_policy_image_name_link {
    type: inner
    sql_on: ${policy_image.policy_id} = ${policy_holder_policy_image_name_link.policy_id} AND ${policy_image.policyimage_num} = ${policy_holder_policy_image_name_link.policyimage_num} AND ${policy_holder_policy_image_name_link.nameaddresssource_id} = 3 ;;
    relationship: one_to_many
  }

  join: policy_holder_name {
    type: inner
    sql_on: ${policy_holder_policy_image_name_link.name_id} = ${policy_holder_name.name_id} AND ${policy_holder_name.detailstatuscode_id} = 1 ;;
    relationship: one_to_one
  }

  join: policy_holder_marital_status {
    view_label: "Policy Holder"
    type: inner
    sql_on: ${policy_holder_name.maritalstatus_id} = ${policy_holder_marital_status.maritalstatus_id} ;;
    relationship: one_to_one
  }

  join: policy_holder_sex {
    view_label: "Policy Holder"
    type: inner
    sql_on: ${policy_holder_name.sex_id} = ${policy_holder_sex.sex_id} ;;
    relationship: one_to_one
  }

  join: driver {
    view_label: "Driver"
    type: left_outer
    sql_on: ${policy_image.policy_id} = ${driver.policy_id} AND ${policy_image.policyimage_num} = ${driver.policyimage_num} AND ${driver.detailstatuscode_id} = 1 ;;
    relationship: one_to_many
  }

  join: driver_name_link {
    type: inner
    sql_on: ${driver.policy_id} = ${driver_name_link.policy_id} AND ${driver.policyimage_num} = ${driver_name_link.policyimage_num} AND ${driver.driver_num} = ${driver_name_link.driver_num} ;;
    relationship: one_to_many
  }

  join: driver_name {
    type: inner
    sql_on: ${driver_name_link.name_id} = ${driver_name.name_id} ;;
    relationship: one_to_one
  }

  join: driver_marital_status {
    view_label: "Driver"
    type: inner
    sql_on: ${driver_name.maritalstatus_id} = ${driver_marital_status.maritalstatus_id} ;;
    relationship: one_to_one
  }

  join: driver_sex {
    view_label: "Driver"
    type: inner
    sql_on: ${driver_name.sex_id} = ${driver_sex.sex_id} ;;
    relationship: one_to_one
  }

  join: driver_dln_state {
    view_label: "Driver"
    type: inner
    sql_on: ${driver_name.dlstate_id} = ${driver_dln_state.state_id} ;;
    relationship: one_to_one
  }

  join: vehicle {
    view_label: "Vehicle"
    type: left_outer
    sql_on: ${policy_image.policy_id} = ${vehicle.policy_id} AND ${policy_image.policyimage_num} = ${vehicle.policyimage_num} AND ${vehicle.detailstatuscode_id} = 1 ;;
    relationship: one_to_many
  }

  join: coverage {
    view_label: "Coverage"
    type: left_outer
    sql_on: ${policy_image.policy_id} = ${coverage.policy_id} AND ${policy_image.policyimage_num} = ${coverage.policyimage_num} AND ${vehicle.vehicle_num} = ${coverage.unit_num} AND ${coverage.detailstatuscode_id} = 1 ;;
    relationship: one_to_many
  }

  join: coverage_code {
    view_label: "Coverage"
    type: inner
    sql_on: ${coverage.coveragecode_id} = ${coverage_code.coveragecode_id} ;;
    relationship: one_to_one
  }

  join: coverage_limit {
    view_label: "Coverage"
    type: inner
    sql_on: ${coverage.coveragelimit_id} = ${coverage_limit.coveragelimit_id} ;;
    relationship: one_to_one
  }

  join: policy_image_attachment_link {
    view_label: "Policy Image"
    type: inner
    sql_on: ${policy_image.policy_id} = ${policy_image_attachment_link.policy_id} AND ${policy_image.policyimage_num} = ${policy_image_attachment_link.policyimage_num} ;;
    relationship: one_to_many
  }

  join: policy_image_address_link {
    type:  inner
    sql_on: ${policy_image.policy_id} = ${policy_image_address_link.policy_id} AND ${policy_image.policyimage_num} = ${policy_image_address_link.policyimage_num} ;;
    relationship: one_to_many
  }

  join: policy_address {
    view_label: "Address"
    type:  inner
    sql_on:  ${policy_image_address_link.address_id} = ${policy_address.address_id};;
    relationship: one_to_one
  }

  join: name_address_source {
    view_label: "Address"
    type: inner
    sql_on: ${policy_address.nameaddresssource_id} = ${name_address_source.nameaddresssource_id} ;;
    relationship: one_to_one
  }

  join: state {
    view_label: "Address"
    type:  inner
    sql_on: ${policy_address.state_id} = ${state.state_id} ;;
    relationship:  one_to_one
  }

  join:  additional_interest {
    view_label: "Additional Interest"
    type: inner
    relationship: many_to_many
    sql_on: ${policy_image.policy_id} = ${additional_interest.policy_id}
      and ${policy_image.policyimage_num} = ${additional_interest.policyimage_num} ;;
  }

  join: additional_interest_list_name_link {
    view_label: "Additional Interest"
    type: inner
    relationship: one_to_one
    sql_on: ${additional_interest.additionalinterestlist_id} = ${additional_interest_list_name_link.additionalinterestlist_id} ;;
  }

  join: name {
    view_label: "Additional Interest"
    type: inner
    relationship: one_to_one
    sql_on: ${additional_interest_list_name_link.nameaddresssource_id} = ${name.nameaddresssource_id}
      and ${additional_interest_list_name_link.name_id} = ${name.name_id};;
  }

  join: v_billing_cash {
    view_label: "Billing"
    type: inner
    relationship: many_to_one
    sql_on: ${v_billing_cash.policy_id} = ${policy.policy_id} ;;
  }

  join:  billing_cash_type {
    view_label: "Billing"
    type:  inner
    relationship: one_to_one
    sql_on: ${v_billing_cash.billingcashtype_id} = ${billing_cash_type.billingcashtype_id} ;;
  }

  join:  billing_reason {
    view_label: "Billing"
    type:  inner
    relationship: one_to_one
    sql_on: ${v_billing_cash.billingreason_id} = ${billing_reason.billingreason_id}
      and ${v_billing_cash.billingreason_id} <> 0 ;;
  }

  join: v_billing_cash_detail {
    view_label: "Billing - Detail"
    type: inner
    relationship: many_to_many
    sql_on: ${v_billing_cash.policy_id} = ${v_billing_cash_detail.policy_id}
      AND ${v_billing_cash.billingcash_num} = ${v_billing_cash_detail.billingcash_num}
       ;;
  }

  join:  v_billing_account_detail {
    view_label: "Policy"
    type: inner
    relationship:one_to_one
    sql_on: ${v_billing_account_detail.policy_id}  = ${policy.policy_id};;
  }

  join: billing_payplan_type {
    view_label: "Policy"
    type: inner
    relationship: one_to_one
    sql_on: ${billing_payplan_type.billingpayplantype_id} = ${v_billing_account_detail.billingpayplantype_id} ;;
  }

  join: v_billing_futures {
    view_label: "Billing - Future"
    type: inner
    relationship: many_to_many
    sql_on: ${v_billing_cash.policy_id} = ${v_billing_futures.policy_id}
      AND ${v_billing_futures.renewal_ver} <> ''
       ;;
  }

  join: users_non_cea {
    view_label: "Policy Image"
    type: inner
    sql_on: ${policy_image.trans_users_id} = ${users_non_cea.users_id} ;;
    relationship: one_to_one
  }

}
