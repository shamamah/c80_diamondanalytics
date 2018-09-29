connection: "c72-prod"

# include all the views
include: "*.view"

explore: claim_control {
  label: "C72-Claims"
  #persist_for: "4 hours"
  view_label: "Claim"

  #Exclude records without claim number
  sql_always_where: ${claim_number} > ''
    AND {% condition dt_claim_transactions_as_of.as_of_date %} claim_control.reported_date {% endcondition %}
    ;;

#   join: claim_type {
#     type: inner
#     relationship: one_to_many
#     sql_on: ${claim_type.claimtype_id} = ${claim_control.claim_type_id} ;;
#   }

    join: dt_claim_days_open {
      view_label: "Claim"
      type: inner
      relationship: one_to_one
      sql_on: ${dt_claim_days_open.claimcontrol_id} = ${claim_control.claimcontrol_id} ;;
    }

    join: claim_control_activity {
      type: inner
      relationship: one_to_many
      sql_on: ${claim_control.claimcontrol_id} = ${claim_control_activity.claimcontrol_id}
        and ${claim_control_activity.num} = 1 ;;
    }

    join: dt_reopen_count {
      type: left_outer
      relationship: one_to_many
      sql_on: ${claim_control.claimcontrol_id} = ${dt_reopen_count.claimcontrol_id} ;;
    }

    join: dt_claim_close_date {
      view_label: "Claim"
      type: left_outer
      relationship: one_to_many
      sql_on: ${claim_control.claimcontrol_id} = ${dt_claim_close_date.claimcontrol_id} ;;
    }

    join: dt_close_count {
      type: left_outer
      relationship: one_to_many
      sql_on: ${claim_control.claimcontrol_id} = ${dt_close_count.claimcontrol_id} ;;
    }

    join: dt_loss_location {
      view_label: "Loss Address"
      type: inner
      relationship: one_to_one
      sql_on: ${claim_control.claimcontrol_id} = ${dt_loss_location.claimcontrol_id} ;;
    }

    join: dt_policy_holder {
      view_label: "Policy Holder"
      type: left_outer
      relationship: one_to_many
      sql_on: ${dt_policy_holder.policy_id} = ${claim_control.policy_id};;
    }

    join: dt_weather_related {
      view_label: "Claim"
      type: inner
      relationship: one_to_many
      sql_on: ${dt_weather_related.claimcontrol_id} = ${claim_control.claimcontrol_id};;
    }

    join: claim_severity {
      type: inner
      relationship: one_to_many
      sql_on: ${claim_severity.claimseverity_id} = ${claim_control.claimseverity_id} ;;
    }

    join: claim_control_status {
      type: inner
      relationship: one_to_many
      sql_on: ${claim_control_status.claimcontrolstatus_id} = ${claim_control.claimcontrolstatus_id} ;;
    }

    join: claim_fault {
      type: inner
      relationship: one_to_many
      sql_on: ${claim_fault.claimfault_id} = ${claim_control.claimfault_id} ;;
    }

    join: claim_loss_type {
      type: inner
      relationship: one_to_many
      sql_on: ${claim_loss_type.claimlosstype_id} = ${claim_control.claimlosstype_id} ;;
    }

    join: v_claim_detail_claimant {
      view_label: "Claimant"
      type: inner
      relationship: one_to_many
      sql_on: ${claim_control.claimcontrol_id} = ${v_claim_detail_claimant.claimcontrol_id} ;;
    }

    join: claimant {
      view_label: "Claimant"
      type: inner
      relationship: one_to_many
      sql_on: ${claim_control.claimcontrol_id} = ${claimant.claimcontrol_id} ;;
    }

    join: dt_coverage_financials_bi {
      view_label: "Coverage Financials"
      type: left_outer
      relationship: one_to_many
      sql_on: ${claim_control.claimcontrol_id} = ${dt_coverage_financials_bi.claimcontrol_id}
        and ${v_claim_detail_claimant.claimant_num} = ${dt_coverage_financials_bi.claimant_num};;
    }

    join: dt_coverage_financials_pd {
      view_label: "Coverage Financials"
      type: left_outer
      relationship: one_to_many
      sql_on: ${claim_control.claimcontrol_id} = ${dt_coverage_financials_pd.claimcontrol_id}
        and ${v_claim_detail_claimant.claimant_num} = ${dt_coverage_financials_pd.claimant_num};;
    }

    join: dt_coverage_financials_med {
      view_label: "Coverage Financials"
      type: left_outer
      relationship: one_to_many
      sql_on: ${claim_control.claimcontrol_id} = ${dt_coverage_financials_med.claimcontrol_id}
        and ${v_claim_detail_claimant.claimant_num} = ${dt_coverage_financials_med.claimant_num};;
    }

    join: dt_coverage_financials_umbi {
      view_label: "Coverage Financials"
      type: left_outer
      relationship: one_to_many
      sql_on: ${claim_control.claimcontrol_id} = ${dt_coverage_financials_umbi.claimcontrol_id}
        and ${v_claim_detail_claimant.claimant_num} = ${dt_coverage_financials_umbi.claimant_num};;
    }

    join: dt_coverage_financials_umpd {
      view_label: "Coverage Financials"
      type: left_outer
      relationship: one_to_many
      sql_on: ${claim_control.claimcontrol_id} = ${dt_coverage_financials_umpd.claimcontrol_id}
        and ${v_claim_detail_claimant.claimant_num} = ${dt_coverage_financials_umpd.claimant_num};;
    }

    join: dt_coverage_financials_pip {
      view_label: "Coverage Financials"
      type: left_outer
      relationship: one_to_many
      sql_on: ${claim_control.claimcontrol_id} = ${dt_coverage_financials_pip.claimcontrol_id}
        and ${v_claim_detail_claimant.claimant_num} = ${dt_coverage_financials_pip.claimant_num};;
    }

    join: dt_coverage_financials_comp {
      view_label: "Coverage Financials"
      type: left_outer
      relationship: one_to_many
      sql_on: ${claim_control.claimcontrol_id} = ${dt_coverage_financials_comp.claimcontrol_id}
        and ${v_claim_detail_claimant.claimant_num} = ${dt_coverage_financials_comp.claimant_num};;
    }

    join: dt_coverage_financials_coll {
      view_label: "Coverage Financials"
      type: left_outer
      relationship: one_to_many
      sql_on: ${claim_control.claimcontrol_id} = ${dt_coverage_financials_coll.claimcontrol_id}
        and ${v_claim_detail_claimant.claimant_num} = ${dt_coverage_financials_coll.claimant_num};;
    }

    join: dt_coverage_financials_rr {
      view_label: "Coverage Financials"
      type: left_outer
      relationship: one_to_many
      sql_on: ${claim_control.claimcontrol_id} = ${dt_coverage_financials_rr.claimcontrol_id}
        and ${v_claim_detail_claimant.claimant_num} = ${dt_coverage_financials_rr.claimant_num};;
    }

    join: dt_claim_inside_adjuster {
      view_label: "Claim"
      type: left_outer
      relationship: one_to_many
      sql_on: ${claim_control.claimcontrol_id} = ${dt_claim_inside_adjuster.claimcontrol_id} ;;
    }

    join: dt_claim_outside_adjuster {
      view_label: "Claim"
      type: left_outer
      relationship: one_to_many
      sql_on: ${claim_control.claimcontrol_id} = ${dt_claim_outside_adjuster.claimcontrol_id} ;;
    }

    join: dt_all_claimants_per_claim {
      view_label: "Claim"
      type: inner
      relationship: one_to_many
      sql_on: ${claim_control.claimcontrol_id} = ${dt_all_claimants_per_claim.claimcontrol_id};;
    }

    # join: coverage_financial_bi {
    #   view_label: "Coverage Financials - BI"
    #   type: left_outer
    #   relationship: many_to_many
    #   sql_on: ${coverage_financial_bi.claimcontrol_id} = ${v_claim_detail_claimant.claimcontrol_id}
    #     AND ${coverage_financial_bi.claimant_num} = ${v_claim_detail_claimant.claimant_num};;
    #   sql_where: ${coverage_financial_bi.coveragecode_id} = 1 ;;
    # }

    # join: coverage_financial_pd {
    #   view_label: "Coverage Financials - PD"
    #   type: inner
    #   relationship: one_to_many
    #   sql_on: ${coverage_financial_pd.claimcontrol_id} = ${v_claim_detail_claimant.claimcontrol_id}
    #     AND ${coverage_financial_pd.claimant_num} = ${v_claim_detail_claimant.claimant_num};;
    #   sql_where: ${coverage_financial_pd.coveragecode_id} = 4 ;;
    # }

    join: v_claim_detail_feature {
      type: left_outer
      relationship: one_to_many
      sql_on: ${v_claim_detail_claimant.claimcontrol_id} = ${v_claim_detail_feature.claimcontrol_id}
               AND ${v_claim_detail_claimant.claimant_num} = ${v_claim_detail_feature.claimant_num}
               ;;
    }
    #STOP ZZZ
    join: v_claim_detail_transaction {
      type: left_outer
      view_label: "Checks & Transactions"
      relationship: one_to_many
      sql_on: ${v_claim_detail_feature.claimcontrol_id} = ${v_claim_detail_transaction.claimcontrol_id}
              AND ${v_claim_detail_feature.claimant_num} = ${v_claim_detail_transaction.claimant_num}
              AND ${v_claim_detail_feature.claimfeature_num} = ${v_claim_detail_transaction.claimfeature_num}
              ;;
            #sql_where: ISNULL(${v_claim_detail_transaction.check_number},'') > '' ;;
      }

      # REPLACED WITH NEXT BLOCK 2018-09-28
      # join: claim_transaction {
      #   type: inner
      #   #view_label: ""
      #   relationship: one_to_one
      #   sql_on: ${claim_transaction.claimcontrol_id} = ${v_claim_detail_transaction.claimcontrol_id}
      #         and ${claim_transaction.claimtransaction_num} = ${v_claim_detail_transaction.claimtransaction_num}
      #         and ${claim_transaction.claimant_num} = ${v_claim_detail_transaction.claimant_num}
      #         and ${claim_transaction.claimfeature_num} = ${v_claim_detail_transaction.claimfeature_num}
      #         ;;
      # }

      join: claim_transaction {
        type: left_outer
        relationship: one_to_many
        sql_on: ${v_claim_detail_feature.claimcontrol_id} = ${claim_transaction.claimcontrol_id}
              and ${v_claim_detail_feature.claimant_num} = ${claim_transaction.claimant_num}
              and ${v_claim_detail_feature.claimfeature_num} = ${claim_transaction.claimfeature_num}
              ;;
      }

      join: dt_claim_transactions_as_of {
        type: left_outer
        view_label: "Claim Financials (As of Date)"
        relationship: many_to_many
        sql_on: ${claim_control.claimcontrol_id} = ${dt_claim_transactions_as_of.claimcontrol_id}
              and ${claim_transaction.claimtransaction_num} = ${dt_claim_transactions_as_of.claimtransaction_num}
              and ${claim_transaction.claimant_num} = ${dt_claim_transactions_as_of.claimant_num}
              and ${claim_transaction.claimfeature_num} = ${dt_claim_transactions_as_of.claimfeature_num}
              and ${dt_claim_transactions_as_of.calc} = 1
              ;;
      }

      join: dt_claim_status_as_of {
        type: inner
        view_label: "Claim Financials (As of Date)"
        relationship: one_to_one
        sql_on: ${claim_control.claimcontrol_id} = ${dt_claim_status_as_of.claimcontrol_id} ;;
      }

      join: claim_transaction_category {
        type: left_outer
        view_label: "Checks & Transactions"
        relationship: one_to_many
        sql_on: ${v_claim_detail_transaction.claimtransactioncategory_id} = ${claim_transaction_category.claimtransacationcategory_id} ;;
      }

      join: claim_pay_type {
        type: left_outer
        view_label: "Checks & Transactions"
        relationship: one_to_many
        sql_on: ${claim_transaction.claimpaytype_id} = ${claim_pay_type.claimpaytype_id} ;;
      }

      join: check_status {
        type: inner
        view_label: "Checks & Transactions"
        relationship: one_to_many
        sql_on: ${v_claim_detail_transaction.checkstatus_id} = ${check_status.checkstatus_id} ;;
      }

      join: claim_catastrophe {
        view_label: "Claim CAT"
        type: left_outer
        sql_on: ${claim_catastrophe.claimcatastrophe_id} = ${claim_control.claimcatastrophe_id} ;;
        #sql_where: ${claim_catastrophe.claimcatastrophe_id} > 0 ;;
        relationship: one_to_one
      }

      join:  policy {
        view_label: "Policy"
        type: left_outer
        relationship: many_to_one
        sql_on: ${policy.policy_id} = ${claim_control.policy_id}  ;;
      }

      join: dt_policy_agency {
        view_label: "Policy"
        type: inner
        relationship: one_to_many
        sql_on: ${policy.policy_id} = ${dt_policy_agency.policy_id} ;;
      }

      # join: current_status {
      #   view_label: "Policy"
      #   type: inner
      #   sql_on: ${policy.policycurrentstatus_id} = ${current_status.policycurrentstatus_id} ;;
      #   relationship: one_to_one
      # }

      join: policy_image {
        type: inner
        sql_on: ${claim_control.policy_id} = ${policy_image.policy_id} ;;
        relationship: many_to_many
      }

      # join: policy_image_address_link {
      #   type:  inner
      #   sql_on: ${policy_image.policy_id} = ${policy_image_address_link.policy_id} AND ${policy_image.policyimage_num} = ${policy_image_address_link.policyimage_num} ;;
      #   relationship: one_to_many
      # }

      # join: policy_address {
      #   view_label: "Address"
      #   type:  inner
      #   sql_on:  ${policy_image_address_link.address_id} = ${policy_address.address_id};;
      #   relationship: one_to_one
      # }

      # join: name_address_source {
      #   view_label: "Address"
      #   type: inner
      #   sql_on: ${policy_address.nameaddresssource_id} = ${name_address_source.nameaddresssource_id} ;;
      #   relationship: one_to_one
      # }

      # join: state {
      #   view_label: "Address"
      #   type:  inner
      #   sql_on: ${policy_address.state_id} = ${state.state_id} ;;
      #   relationship:  one_to_one
      # }

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
