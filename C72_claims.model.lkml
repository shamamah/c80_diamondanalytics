connection: "c72-prod"

# include all the views
include: "*.view"

explore: claim_control {
  label: "Claims"
  persist_for: "4 hours"
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
