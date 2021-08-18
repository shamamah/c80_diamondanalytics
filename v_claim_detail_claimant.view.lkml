view: v_claim_detail_claimant {
  #Commented Dimensions are not used for SCS

  sql_table_name: dbo.vClaimDetail_Claimant ;;
  view_label: "Claimant"

  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${claimcontrol_id},${claimant_num}) ;;
  }

  #---------------------------------------------------------------
  dimension: claimcontrol_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: claimant_num {
    label: "Number"
    type: number
    hidden: yes
    sql: ${TABLE}.claimant_num ;;
  }
  #---------------------------------------------------------------

  # dimension: is_insured1 {
  #   type: string
  #   label: "Is Insured 1"
  #   sql: case when ${TABLE}.is_insured1=1 then 'Yes' else 'No' end ;;
  # }

  # dimension: is_insured2 {
  #   type: string
  #   label: "Is Insured 2"
  #   sql: case when ${TABLE}.is_insured2=1 then 'Yes' else 'No' end ;;
  # }

  #SH 2021-08-17 Remove
  # dimension: name {
  #   label: "Name (WS)"
  #   type: string
  #   sql: ${TABLE}.name ;;
  # }

  dimension: display_name {
    type: string
    label: "Name"
    sql: ${TABLE}.display_name ;;
  }

  dimension: city_state {
    label: "City, State"
    view_label: "Claimant Address"
    type: string
    sql: ${TABLE}.city_state ;;
  }

  dimension: display_address {
    type: string
    label: "Address"
    view_label: "Claimant Address"
    sql: ${TABLE}.display_address ;;
  }

  dimension: city {
    view_label: "Claimant Address"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: state {
    view_label: "Claimant Address"
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: in_litigation {
    hidden: yes
    type: string
    label: "Is Litigated"
    sql: case when ${TABLE}.in_litigation=1 then 'Yes' else 'No' end ;;
  }

  dimension: claimanttypedscr {
    type: string
    label: "Type"
    sql: ${TABLE}.claimanttypedscr ;;
  }

  dimension: claimanttypecode {
    type: string
    hidden: yes
    sql: ${TABLE}.claimanttypecode ;;
  }

  dimension: relationshiptypedscr {
    type: string
    label: "Relationship"
    sql: ${TABLE}.relationshiptypedscr ;;
  }

  dimension: relationshiptypecode {
    hidden: yes
    type: string
    sql: ${TABLE}.relationshiptypecode ;;
  }

  # dimension: person {
  #   type: number
  #   sql: ${TABLE}.person ;;
  # }

  # dimension: taxnum {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.taxnum ;;
  # }

  dimension: status_dscr {
    label: "Status"
    type: string
    sql: ${TABLE}.status_dscr ;;
  }

  # dimension: indemnity_reserve {
  #   type: number
  #   hidden: yes
  #   sql: ${TABLE}.indemnity_reserve ;;
  # }

  #SH 2021-03-30 Uncommented the financials at the claimant level, needed for TT 315090, but still hidden from user
  dimension: indemnity_paid {
    type: number
    hidden: yes
    sql: ${TABLE}.indemnity_paid ;;
  }

  # dimension: expense_reserve {
  #   type: number
  #   hidden: yes
  #   sql: ${TABLE}.expense_reserve ;;
  # }

  # dimension: expense_paid {
  #   type: number
  #   hidden: yes
  #   sql: ${TABLE}.expense_paid ;;
  # }

  # dimension: alae_reserve {
  #   type: number
  #   hidden: yes
  #   sql: ${TABLE}.alae_reserve ;;
  # }

  # dimension: alae_paid {
  #   type: number
  #   hidden: yes
  #   sql: ${TABLE}.alae_paid ;;
  # }

  # dimension: anticipated_expense_recovery {
  #   type: number
  #   hidden: yes
  #   sql: ${TABLE}.anticipated_expense_recovery ;;
  # }

  # dimension: expense_recovery {
  #   type: number
  #   hidden: yes
  #   sql: ${TABLE}.expense_recovery ;;
  # }

  # dimension: anticipated_salvage {
  #   type: number
  #   hidden: yes
  #   sql: ${TABLE}.anticipated_salvage ;;
  # }

  # dimension: salvage {
  #   type: number
  #   hidden: yes
  #   sql: ${TABLE}.salvage ;;
  # }

  # dimension: anticipated_subro {
  #   type: number
  #   hidden: yes
  #   sql: ${TABLE}.anticipated_subro ;;
  # }

  # dimension: subro {
  #   type: number
  #   hidden: yes
  #   sql: ${TABLE}.subro ;;
  # }

  # dimension: anticipated_other_recovery {
  #   type: number
  #   hidden: yes
  #   sql: ${TABLE}.anticipated_other_recovery ;;
  # }

  # dimension: other_recovery {
  #   type: number
  #   hidden: yes
  #   sql: ${TABLE}.other_recovery ;;
  # }

  # dimension: claimantstatus_id {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.claimantstatus_id ;;
  # }

  # dimension: claimcontrolproperty_num {
  #   type: number
  #   label: "Property Number"
  #   sql: ${TABLE}.claimcontrolproperty_num ;;
  # }

  # dimension: claimcontrolvehicle_num {
  #   type: number
  #   hidden: yes
  #   sql: ${TABLE}.claimcontrolvehicle_num ;;
  # }

  # dimension: driverexcludetypedscr {
  #   label: "Excluded Driver Description"
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.driverexcludetypedscr ;;
  # }

  # dimension: driverexcludetypecode {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.driverexcludetypecode ;;
  # }

  # dimension: driver_num {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.driver_num ;;
  # }

  # dimension: applicant_num {
  #   type: number
  #   hidden: yes
  #   sql: ${TABLE}.applicant_num ;;
  # }

  dimension: is_represented {
    hidden: yes
    type: string
    label: "Is Represented"
    sql: case when ${TABLE}.is_represented=1 then 'Yes' else 'No' end ;;
  }

  dimension: is_litigated_represented {
    label: "Litigated/Represented"
    type: yesno
    sql: (${is_represented} = 'Yes' OR ${in_litigation} = 'Yes') ;;
  }

  #DATA ELEMENTS COMPLETED------------------------------------------------------------

  measure: count {
    type: count
    drill_fields: [claimant_stats*]
  }

  #SH 2020-06-03 Add a new data point to help with MCAS, TT 302005
  measure: count_with_indemnity_paid {
    label: "Count with Paid Loss"
    type: count
    drill_fields: [claimant_stats*]
    filters: {
      #SH 2021-03-30 Change the condition from feature.indemnity_paid to claimant.indemnity_paid.  TT 315090
      #field: v_claim_detail_feature.indemnity_paid
      field: v_claim_detail_claimant.indemnity_paid
      value: ">0"
    }
  }

  #SH 2020-06-03 Add a new data point to help with MCAS, TT 302005
  measure: count_without_indemnity_paid {
    label: "Count without Paid Loss"
    type: count
    drill_fields: [claimant_stats*]
    filters: {
      #SH 2021-03-30 Change the condition from feature.indemnity_paid to claimant.indemnity_paid.  TT 315090
      #field: v_claim_detail_feature.indemnity_paid
      field: v_claim_detail_claimant.indemnity_paid
      value: "=0"
    }
  }

  #SH 2019-12-19  TT294238
  measure: count_percent {
    label: "Percent"
    type: percent_of_total
    sql: ${count} ;;
    drill_fields: [claimant_stats*]
  }

  measure: litigated_represented_count {
    label: "Represented Count"
    type: count
    drill_fields: [claimant_stats*]
    filters: {
      field: is_litigated_represented
      value: "Yes"
    }
  }

  # measure: sum_anticipated_expense_recovery {
  #   type: sum
  #   label: "Anticipated Expense Recovery"
  #   view_label: "Claimant TEST"
  #   sql: ${anticipated_expense_recovery} ;;
  #   value_format: "$0.00"
  # }

  # measure: sum_anticipated_other_recovery {
  #   type: sum
  #   label: "Anticipated Other Recovery"
  #   view_label: "Claimant TEST"
  #   sql: ${anticipated_other_recovery} ;;
  #   value_format: "$0.00"
  # }

  # measure: sum_anticipated_salvage {
  #   type: sum
  #   label: "Anticipated Salvage"
  #   view_label: "Claimant TEST"
  #   sql: ${anticipated_salvage} ;;
  #   value_format: "$0.00"
  # }

  # measure: sum_anticipated_subro {
  #   type: sum
  #   label: "Anticipated Subro"
  #   view_label: "Claimant TEST"
  #   sql: ${anticipated_subro} ;;
  #   value_format: "$0.00"
  # }

  # measure: sum_other_recovery {
  #   type: sum
  #   label: "Other Recovery"
  #   view_label: "Claimant TEST"
  #   sql: ${other_recovery} ;;
  #   value_format: "$0.00"
  # }

  # measure: sum_salvage {
  #   type: sum
  #   label: "salvage"
  #   view_label: "Claimant TEST"
  #   sql: ${salvage} ;;
  #   value_format: "$0.00"
  # }

  # measure: sum_subro {
  #   type: sum
  #   label: "Subro"
  #   view_label: "Claimant TEST"
  #   sql: ${subro} ;;
  #   value_format: "$0.00"
  # }

  # measure:  sum_indemnity_paid {
  #   type: sum
  #   label: "Total Claimant Indemnity Paid"
  #   view_label: "Claimant TEST"
  #   sql: ${indemnity_paid} ;;
  # }

  # measure:  sum_indemnity_reserve {
  #   type:  sum
  #   label: "Total Claimant Indemnity Reserve"
  #   view_label: "Claimant TEST"
  #   sql:  ${indemnity_reserve} ;;
  # }

  # measure: sum_total_indemnity_incurred{
  #   type: number
  #   label: "Total Claimant Indemnity Incurred"
  #   view_label: "Claimant TEST"
  #   sql: ${sum_indemnity_paid} + ${sum_indemnity_reserve};;
  # }

  # measure:  sum_expense_paid {
  #   type: sum
  #   label: "Total Claimant Expense Paid"
  #   view_label: "Claimant TEST"
  #   sql: ${expense_paid} ;;
  # }

  # measure:  sum_expense_reserve {
  #   type:  sum
  #   label: "Total Claimant Expense Reserve"
  #   view_label: "Claimant TEST"
  #   sql:  ${expense_reserve} ;;
  # }

  # measure:  sum_expense_recovery {
  #   type:  sum
  #   label: "Total Claimant Expense Recovery"
  #   view_label: "Claimant TEST"
  #   sql:  ${expense_recovery} ;;
  # }

  #SH 2020-01-13 Add examiner and supervisor initials to drill-down on claimant count TT 294238
  set: claimant_stats {
    fields: [
      claim_control.claim_number,
      policy.current_policy,
      claimant_num,
      display_name,
      relationshiptypedscr,
      status_dscr,
      claimanttypedscr,
      display_address,
      city_state,
      claimant.contacted_date_time,
      claimant.pcadded_time,
      dt_claim_inside_adjuster.initials,
      dt_claim_supervisor.supervisor_initials
    ]
  }

}
