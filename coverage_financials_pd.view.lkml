view: coverage_financial_pd {
  #Commented Dimensions are not used for SCS

  sql_table_name: dbo.vClaimDetail_Feature ;;

  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${claimcontrol_id},${claimant_num},${claimfeature_num}) ;;
  }

  #---------------------------------------------------------------
  dimension: claimcontrol_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: claimant_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimant_num ;;
  }

  dimension: claimfeature_num {
    hidden:  yes
    type: number
    sql: ${TABLE}.claimfeature_num ;;
  }
  #---------------------------------------------------------------

  # dimension: exposure_dscr {
  #   label: "Exposure Description"
  #   type: string
  #   sql: ${TABLE}.exposure_dscr ;;
  # }

  # dimension: subexposure_dscr {
  #   label: "Subexposure Description"
  #   type: string
  #   sql: ${TABLE}.subexposure_dscr ;;
  # }

  # dimension: coverage_dscr {
  #   label: "Coverage"
  #   type: string
  #   sql: ${TABLE}.coverage_dscr ;;
  # }

  # dimension: subcoverage_dscr {
  #   label: "Subcoverage Description"
  #   type: string
  #   sql: ${TABLE}.subcoverage_dscr ;;
  # }

  # dimension: record_only {
  #   type: string
  #   sql: case when ${TABLE}.record_only=0 then 'Yes' else 'No' end ;;
  # }

  # dimension: in_suit {
  #   type: string
  #   label: "Is In Suit"
  #   sql: case when ${TABLE}.in_suit=1 then 'Yes' else 'No' end;;
  # }

  # dimension_group: statute_of_limitations {
  #   type: time
  #   timeframes: [time, date, week, month]
  #   sql: ${TABLE}.statute_of_limitations_date ;;
  # }

  # dimension: inside_adjuster {
  #   type: string
  #   sql: ${TABLE}.inside_adjuster ;;
  # }

  # dimension: outside_adjuster {
  #   type: string
  #   sql: ${TABLE}.outside_adjuster ;;
  # }

  # dimension: status_dscr {
  #   type: string
  #   label: "Status (Claimant/Coverage)"
  #   sql: ${TABLE}.status_dscr ;;
  # }

  dimension: initial_indemnity_reserve {
    hidden: yes
    type: number
    sql: ${TABLE}.initial_indemnity_reserve ;;
    value_format_name: usd
  }

  dimension: indemnity_reserve {
    hidden: yes
    type: number
    sql: ${TABLE}.indemnity_reserve ;;
    value_format_name: usd
  }

  dimension: indemnity_paid {
    hidden: yes
    type: number
    sql: ${TABLE}.indemnity_paid ;;
    value_format_name: usd
  }

  dimension: initial_expense_reserve {
    hidden: yes
    type: number
    sql: ${TABLE}.initial_expense_reserve ;;
    value_format_name: usd
  }

  dimension: expense_reserve {
    hidden: yes
    type: number
    sql: ${TABLE}.expense_reserve ;;
    value_format_name: usd
  }

  dimension: expense_paid {
    hidden: yes
    type: number
    sql: ${TABLE}.expense_paid ;;
    value_format_name: usd
  }

  dimension: alae_reserve {
    hidden: yes
    type: number
    sql: ${TABLE}.alae_reserve ;;
    value_format: "$#,##0.00"
  }

  dimension: alae_paid {
    hidden: yes
    type: number
    sql: ${TABLE}.alae_paid ;;
    value_format_name: usd
  }

  # dimension: initial_anticipated_expense_recovery {
  #   type: number
  #   sql: ${TABLE}.initial_anticipated_expense_recovery ;;
  #   value_format: "$#,##0.00"
  # }

  # dimension: anticipated_expense_recovery {
  #   type: number
  #   sql: ${TABLE}.anticipated_expense_recovery ;;
  #   value_format: "$#,##0.00"
  # }

  dimension: expense_recovery {
    hidden: yes
    type: number
    label: "Expense Recovery"
    sql: ${TABLE}.expense_recovery ;;
    value_format_name: usd
  }

  # dimension: initial_anticipated_salvage {
  #   type: number
  #   sql: ${TABLE}.initial_anticipated_salvage ;;
  #   value_format: "$#,##0.00"
  # }

  # dimension: anticipated_salvage {
  #   type: number
  #   sql: ${TABLE}.anticipated_salvage ;;
  #   value_format: "$#,##0.00"
  # }

  dimension: salvage {
    hidden: yes
    type: number
    sql: ${TABLE}.salvage ;;
    value_format_name: usd
  }

  # dimension: initial_anticipated_subro {
  #   type: number
  #   sql: ${TABLE}.initial_anticipated_subro ;;
  #   value_format: "$#,##0.00"
  # }

  dimension: subro {
    hidden:yes
    type: number
    sql: ${TABLE}.subro ;;
    value_format_name: usd
  }

  # dimension: initial_anticipated_other_recovery {
  #   type: number
  #   sql: ${TABLE}.initial_anticipated_other_recovery ;;
  #   value_format: "$#,##0.00"
  # }

  # dimension: anticipated_other_recovery {
  #   type: number
  #   sql: ${TABLE}.anticipated_other_recovery ;;
  #   value_format: "$#,##0.00"
  # }

  # dimension: other_recovery {
  #   type: number
  #   sql: ${TABLE}.other_recovery ;;
  #   value_format: "$#,##0.00"
  # }

  # dimension: claimfeaturestatus_id {
  #   type: number
  #   sql: ${TABLE}.claimfeaturestatus_id ;;
  # }

  # dimension: claimpersonnel_id {
  #   type: number
  #   sql: ${TABLE}.claimpersonnel_id ;;
  # }

  # dimension: display_name {
  #   type: string
  #   sql: ${TABLE}.display_name ;;
  # }

  # dimension: users_id {
  #   type: number
  #   sql: ${TABLE}.users_id ;;
  # }

  # dimension: claimdenialreason_id {
  #   type: number
  #   sql: ${TABLE}.claimdenialreason_id ;;
  # }

  # dimension: claimdenialusers_id {
  #   type: number
  #   sql: ${TABLE}.claimdenialusers_id ;;
  # }

  # dimension: claimdenialreason_remarks {
  #   label: "Denial Reason Remarks"
  #   type: string
  #   sql: ${TABLE}.claimdenialreason_remarks ;;
  # }

  # dimension: denied {
  #   type: string
  #   label: "Is Denied"
  #   sql: case when ${TABLE}.denied=1 then 'Yes' else 'No' end ;;
  # }

  # dimension_group: claimdenial_date {
  #   label: "Claim Denial"
  #   type: time
  #   timeframes: [time, date, week, month]
  #   sql: ${TABLE}.claimdenial_date ;;
  # }

  dimension: coveragecode_id {
    hidden: yes
    type: number
    sql: ${TABLE}.coveragecode_id ;;
  }

  # dimension: subcoveragecode_id {
  #   type: number
  #   sql: ${TABLE}.subcoveragecode_id ;;
  # }

  # dimension: coveragecode {
  #   type: string
  #   hidden: yes
  #   label: "Coverage Code"
  #   sql: ${TABLE}.coveragecode ;;
  # }

  # dimension: claimexposure_id {
  #   type: number
  #   hidden: yes
  #   sql: ${TABLE}.claimexposure_id ;;
  # }

  # dimension: claimsubexposure_num {
  #   label: "Claim Subexposure Number"
  #   type: number
  #   sql: ${TABLE}.claimsubexposure_num ;;
  # }

  # dimension: claimcoverage_num {
  #   label: "Claim Coverage Number"
  #   type: number
  #   hidden: yes
  #   sql: ${TABLE}.claimcoverage_num ;;
  # }

  # dimension: claimsubcoverage_num {
  #   label: "Claim Subcoverage Number"
  #   type: number
  #   sql: ${TABLE}.claimsubcoverage_num ;;
  # }

  #DATA ELEMENTS COMPLETED-------------------------------------------------------

  # measure: count {
  #   type: count
  #   label: "Count"
  #   drill_fields: [feature_stats*]
  # }

  measure:  sum_indemnity_paid {
    type: sum
    label: "Paids"
    sql: ${indemnity_paid} ;;
    value_format_name: usd
  }

  measure:  sum_indemnity_reserve {
    type:  sum
    label: "Loss Reserves"
    sql:  ${indemnity_reserve} ;;
    value_format_name: usd
  }

  measure: sum_total_indemnity_incurred{
    hidden: yes
    type: number
    label: "Indemnity: Incurred"
    sql: ${sum_indemnity_paid} + ${sum_indemnity_reserve};;
    value_format_name: usd
  }

  measure: ave_total_indemnity_incurred{
    hidden: yes
    type: average
    label: "Indemnity: Average Incurred"
    sql: ${indemnity_reserve} + ${indemnity_paid}  ;;
    value_format_name: usd
  }

  measure:  sum_expense_paid {
    hidden: yes
    type: sum
    label: "Expense: Paid"
    sql: ${expense_paid} ;;
    value_format_name: usd
  }

  measure:  sum_expense_reserve {
    hidden: yes
    type:  sum
    label: "Expense: Reserve"
    sql:  ${expense_reserve} ;;
    value_format_name: usd
  }

  measure:  sum_expense_recovery {
    hidden: yes
    type:  sum
    label: "Expense: Recovery"
    sql:  ${expense_recovery} ;;
    value_format_name: usd
  }

  measure:  sum_alae_paid {
    hidden: yes
    type: sum
    label: "ALAE Paid"
    sql: ${alae_paid} ;;
    value_format_name: usd
  }

  measure:  sum_alae_reserve {
    hidden: yes
    type: sum
    label: "ALAE Reserve"
    sql: ${alae_reserve} ;;
    value_format_name: usd
  }

  measure: sum_initial_indemnity_reserve {
    hidden: yes
    type: sum
    label: "Indemnity: Initial Reserve"
    sql: ${initial_indemnity_reserve} ;;
    value_format_name: usd
  }

  measure: sum_initial_expense_reserve {
    hidden: yes
    type: sum
    label: "Indemnity: Initial Expense"
    sql: ${initial_expense_reserve} ;;
    value_format_name: usd
  }

  measure: sum_salvage {
    type: sum
    label: "Salvage"
    sql: ${salvage} ;;
    value_format_name: usd
  }

  measure: sum_subro {
    type: sum
    label: "Subro"
    sql: ${subro} ;;
    value_format_name: usd
  }

  # set: feature_stats {
  #   fields: [
  #     exposure_dscr,
  #     coveragecode,
  #     coverage_dscr,
  #     inside_adjuster,
  #     outside_adjuster,
  #     indemnity_reserve,
  #     indemnity_paid,
  #     expense_reserve,
  #     expense_paid
  #   ]
  # }
}
