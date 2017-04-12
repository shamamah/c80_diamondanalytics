connection: "c63-test-cea"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: claim_control {
  access_filter: {
    field: company_state_lob.commercial_name1
    user_attribute: company_name
  }
  label: "Claim"
  view_label: "Claim"
  join: v_claim_detail_claimant {
    view_label: "Claim Detail Claimant"
    type: inner
    relationship: one_to_many
    sql_on: ${claim_control.claimcontrol_id} = ${v_claim_detail_claimant.claimcontrol_id} ;;
  }

  join: v_claim_detail_feature {
    view_label: "Claim Detail Feature"
    type: inner
    relationship: one_to_many
    sql_on: ${v_claim_detail_claimant.claimcontrol_id} = ${v_claim_detail_feature.claimcontrol_id}
      AND ${v_claim_detail_claimant.claimant_num} = ${v_claim_detail_feature.claimant_num}
       ;;
  }

  join: v_claim_detail_transaction {
    view_label: "Claim Detail Transaction"
    type: inner
    relationship: one_to_many
    sql_on: ${v_claim_detail_feature.claimcontrol_id} = ${v_claim_detail_transaction.claimcontrol_id}
      AND ${v_claim_detail_feature.claimant_num} = ${v_claim_detail_transaction.claimant_num}
      AND ${v_claim_detail_feature.claimfeature_num} = ${v_claim_detail_transaction.claimfeature_num}
       ;;
  }

  join: claim_catastrophe {
    view_label: "Claim"
    type: inner
    sql_on: ${claim_catastrophe.claimcatastrophe_id} = ${claim_control.claimcatastrophe_id} ;;
    relationship: one_to_one

  }

  join:  policy {
    type: left_outer
    relationship: many_to_one
    sql_on: ${policy.policy_id} = ${claim_control.policy_id}  ;;

  }

  join: current_status {
    type: inner
    sql_on: ${policy.policycurrentstatus_id} = ${current_status.policycurrentstatus_id} ;;
    relationship: one_to_one
  }

  join: policy_image {
    type: inner
    sql_on: ${claim_control.policy_id} = ${policy_image.policy_id} ;;
    relationship: many_to_many
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

}
# explore: v_billing_cash {
#   label: "Billing"
#   view_label: "Billing Cash"

#   join:  billing_cash_type {
#     view_label: "Billing Cash"
#     type:  inner
#     relationship: one_to_one
#     sql_on: ${v_billing_cash.billingcashtype_id} = ${billing_cash_type.billingcashtype_id} ;;
#   }

#   join:  billing_reason {
#     view_label: "Cash"
#     type:  inner
#     relationship: one_to_one
#     sql_on: ${v_billing_cash.billingreason_id} = ${billing_reason.billingreason_id}
#     and ${v_billing_cash.billingreason_id} <> 0 ;;
#   }

#   join: v_billing_cash_detail {
#   view_label: "Cash Detail"
#   type: inner
#     relationship: many_to_many
#     sql_on: ${v_billing_cash.policy_id} = ${v_billing_cash_detail.policy_id}
#       AND ${v_billing_cash.billingcash_num} = ${v_billing_cash_detail.billingcash_num}
#       ;;
#   }

#   join: policy {
#     type: inner
#     relationship: many_to_one
#     sql_on: ${v_billing_cash.policy_id} = ${policy.policy_id} ;;
#   }

#   join:  v_billing_account_detail {
#     view_label: "Policy"
#     type: inner
#     relationship:one_to_one
#     sql_on: ${v_billing_account_detail.policy_id}  = ${policy.policy_id};;
#   }

#   join: billing_payplan_type {
#     view_label: "Policy"
#     type: inner
#     relationship: one_to_one
#     sql_on: ${billing_payplan_type.billingpayplantype_id} = ${v_billing_account_detail.billingpayplantype_id} ;;
#   }

#   join: v_billing_futures {
#     view_label: "Futures"
#     type: inner
#     relationship: many_to_many
#     sql_on: ${v_billing_cash.policy_id} = ${v_billing_futures.policy_id}
#       AND ${v_billing_futures.renewal_ver} <> ''
#       ;;
#   }
# }

explore: policy_cached {
  view_name: policy
  extends: [policy]
  persist_for: "12 hours"
  hidden: yes

}

explore: policy {
  access_filter: {
    field: company_state_lob.commercial_name1
    user_attribute: company_name
  }
  join: policy_image {
    type: inner
    sql_on: ${policy.policy_id} = ${policy_image.policy_id} ;;
    relationship: one_to_many
  }

  join: current_status {
    view_label: "Policy"
    type: inner
    sql_on: ${policy.policycurrentstatus_id} = ${current_status.policycurrentstatus_id} ;;
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

  join: v_c63_offer_conversion_rate {
    view_label: "Company/State/LOB"
    type: inner
    sql_on: ${company_state_lob.company_id} = ${v_c63_offer_conversion_rate.company_id} ;;
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

  join: location {
    view_label: "Location"
    type: left_outer
    sql_on: ${policy_image.policy_id} = ${location.policy_id} AND ${policy_image.policyimage_num} = ${location.policyimage_num} AND ${location.detailstatuscode_id} = 1 ;;
    relationship: one_to_many
  }
  join: v_construction_type {
    view_label: "Location"
    type: inner
    sql_on: ${location.contructiontype_id} = ${v_construction_type.constructiontype_id} ;;
    relationship: one_to_one
  }
  join: v_program_type {
    view_label: "Location"
    type: inner
    sql_on: ${location.programtype_id} = ${v_program_type.programtype_id} ;;
    relationship: one_to_one
  }
  join: v_roof_type {
    view_label: "Location"
    type: inner
    sql_on: ${location.rooftype_id} = ${v_roof_type.rooftype_id} ;;
    relationship: one_to_one
  }
  join: v_number_of_stories {
    view_label: "Location"
    type: inner
    sql_on: ${location.numberofstoriestype_id} = ${v_number_of_stories.numberofstoriestype_id} ;;
    relationship: one_to_one
  }
  join: number_of_chimneys_type {
    view_label: "Location"
    type: inner
    sql_on: ${location.numberofchimneystype_id} = ${number_of_chimneys_type.numberofchimneystype_id} ;;
    relationship: one_to_one
    }
  # - join: location_name_link
  #   type: inner
  #   sql_on: ${location.policy_id} = ${location_name_link.policy_id} AND ${location.policyimage_num} = ${location_name_link.policyimage_num} AND ${location.location_num} = ${location_name_link.location_num}
  #   relationship: one_to_many

  # - join: location_name
  #   type: inner
  #   sql_on: ${location_name_link.name_id} = ${location_name.name_id}
  #   relationship: one_to_one

  join: location_address_link {
    type: inner
    sql_on: ${location.policy_id} = ${location_address_link.policy_id} AND ${location.policyimage_num} = ${location_address_link.policyimage_num} AND ${location.location_num} = ${location_address_link.location_num} ;;
    relationship: one_to_many
  }

  join: location_address {
    view_label: "Location"
    type: inner
    sql_on: ${location_address_link.address_id} = ${location_address.address_id} ;;
    relationship: one_to_one
  }

  join: coverage {
    view_label: "Coverage"
    type: left_outer
    sql_on: ${policy_image.policy_id} = ${coverage.policy_id} AND ${policy_image.policyimage_num} = ${coverage.policyimage_num} AND ${location.location_num} = ${coverage.unit_num} AND ${coverage.detailstatuscode_id} = 1 ;;
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

  join: users {
    view_label: "Users"
    type: inner
    sql_on: ${policy_image.trans_users_id} = ${users.users_id} ;;
    relationship: one_to_one
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

  join: v_c63_looker_accepted_offers {
    view_label: "Policy"
    type: inner
    relationship: many_to_many
    sql_on: ${policy.policy_id} = ${v_c63_looker_accepted_offers.policy_id}
       ;;
  }

  join: v_c63_looker_total_offers {
    view_label: "Policy"
    type: inner
    relationship: many_to_many
    sql_on: ${policy.policy_id} = $v_c63_looker_total_offers.policy_id}
       ;;
  }

}

explore: v_c63_rh_inbound_xml {
  access_filter: {
    field: company_state_lob.commercial_name1
    user_attribute: company_name
  }
  label: "Operations"
  view_label: "Operations"

  join: company_state_lob {
    view_label: "Company"
    type: left_outer
    sql_on: ${v_c63_rh_inbound_xml.company_id} = ${company_state_lob.company_id} ;;
    relationship: one_to_one
  }

  join: policy {
    type: left_outer
    sql_on: ${policy.policy_id} = ${v_c63_rh_inbound_xml.policy_id} ;;
    relationship: many_to_one
  }

  join: current_status {
    type: inner
    sql_on: ${policy.policycurrentstatus_id} = ${current_status.policycurrentstatus_id} ;;
    relationship: one_to_one
  }

  join: policy_image {
    type: left_outer
    sql_on: ${v_c63_rh_inbound_xml.policy_id} = ${policy_image.policy_id}
      AND ${v_c63_rh_inbound_xml.policyimage_num} = ${policy_image.policyimage_num}
      ;;
    relationship: many_to_many
  }

  join: version {
    type: left_outer
    sql_on: ${policy_image.version_id} = ${version.version_id} ;;
    relationship: many_to_one
  }



}
