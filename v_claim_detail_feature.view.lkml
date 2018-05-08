view: v_claim_detail_feature {
  sql_table_name: dbo.vClaimDetail_Feature ;;

  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${claimcontrol_id},${claimant_num},${claimfeature_num}) ;;
  }

  dimension: alae_paid {
    type: string
    hidden: yes
    sql: ${TABLE}.alae_paid ;;
  }

  dimension: alae_reserve {
    type: string
    hidden: yes
    sql: ${TABLE}.alae_reserve ;;
  }

  dimension: anticipated_expense_recovery {
    type: string
    sql: ${TABLE}.anticipated_expense_recovery ;;
  }

  dimension: anticipated_other_recovery {
    type: string
    sql: ${TABLE}.anticipated_other_recovery ;;
  }

  dimension: anticipated_salvage {
    type: string
    sql: ${TABLE}.anticipated_salvage ;;
  }

  dimension: anticipated_subro {
    type: string
    sql: ${TABLE}.anticipated_subro ;;
  }

  dimension: claimant_num {
    label: "Claimant Number"
    type: number
    sql: ${TABLE}.claimant_num ;;
  }

  dimension: claimcontrol_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: claimcoverage_num {
    label: "Claim Coverage Number"
    type: number
    sql: ${TABLE}.claimcoverage_num ;;
  }

  dimension_group: claimdenial {
    label: "Claim Denial"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.claimdenial_date ;;
  }

  dimension: claimdenialreason_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimdenialreason_id ;;
  }

  dimension: claimdenialreason_remarks {
    label: "Denial Reason Remarks"
    type: string
    sql: ${TABLE}.claimdenialreason_remarks ;;
  }

  dimension: claimdenialusers_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimdenialusers_id ;;
  }

  dimension: claimexposure_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimexposure_id ;;
  }

  dimension: claimfeature_num {
    label: "Claim Feature Number"
    type: number
    sql: ${TABLE}.claimfeature_num ;;
  }

  dimension: claimfeaturestatus_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimfeaturestatus_id ;;
  }

  dimension: claimpersonnel_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimpersonnel_id ;;
  }

  dimension: claimsubcoverage_num {
    label: "Claim Subcoverage Number"
    type: number
    sql: ${TABLE}.claimsubcoverage_num ;;
  }

  dimension: claimsubexposure_num {
    label: "Claim Subexposure Number"
    type: number
    sql: ${TABLE}.claimsubexposure_num ;;
  }

  dimension: coverage_dscr {
    label: "Coverage"
    type: string
    sql: ${TABLE}.coverage_dscr ;;
  }

  dimension: coveragecode {
    type: string
    hidden: yes
    sql: ${TABLE}.coveragecode ;;
  }

  dimension: coveragecode_id {
    type: number
    hidden: yes
    sql: ${TABLE}.coveragecode_id ;;
  }

  dimension: denied {
    type: yesno
    sql: case when ${TABLE}.denied = 'true' then 'Yes' else 'No' end ;;
  }

  dimension: display_name {
    type: string
    hidden: yes
    sql: ${TABLE}.display_name ;;
  }

  dimension: expense_paid {
    type: string
    hidden: yes
    sql: ${TABLE}.expense_paid ;;
  }

  dimension: expense_recovery {
    type: string
    hidden: yes
    sql: ${TABLE}.expense_recovery ;;
  }

  dimension: expense_reserve {
    type: string
    hidden: yes
    sql: ${TABLE}.expense_reserve ;;
  }

  dimension: exposure_dscr {
    label: "Exposure Description"
    type: string
    sql: ${TABLE}.exposure_dscr ;;
  }

  dimension: in_suit {
    type: yesno
    sql: case when ${TABLE}.in_suit = 'true' then 'Yes' else 'No' end;;
  }

  dimension: indemnity_paid {
    type: string
    hidden: yes
    sql: ${TABLE}.indemnity_paid ;;
  }

  dimension: indemnity_reserve {
    type: string
    hidden: yes
    sql: ${TABLE}.indemnity_reserve ;;
  }

  dimension: initial_anticipated_expense_recovery {
    type: string
    sql: ${TABLE}.initial_anticipated_expense_recovery ;;
  }

  dimension: initial_anticipated_other_recovery {
    type: string
    sql: ${TABLE}.initial_anticipated_other_recovery ;;
  }

  dimension: initial_anticipated_salvage {
    type: string
    sql: ${TABLE}.initial_anticipated_salvage ;;
  }

  dimension: initial_anticipated_subro {
    type: string
    sql: ${TABLE}.initial_anticipated_subro ;;
  }

  dimension: initial_expense_reserve {
    type: string
    sql: ${TABLE}.initial_expense_reserve ;;
  }

  dimension: initial_indemnity_reserve {
    type: string
    sql: ${TABLE}.initial_indemnity_reserve ;;
  }

  dimension: inside_adjuster {
    type: string
    sql: ${TABLE}.inside_adjuster ;;
  }

  dimension: other_recovery {
    type: string
    sql: ${TABLE}.other_recovery ;;
  }

  dimension: outside_adjuster {
    type: string
    sql: ${TABLE}.outside_adjuster ;;
  }

  dimension: record_only {
    type: yesno
    sql: case when ${TABLE}.record_only = 'true' then 'Yes' else 'No' end ;;
  }

  dimension: salvage {
    type: string
    sql: ${TABLE}.salvage ;;
  }

  dimension: status_dscr {
    type: string
    label: "Status"
    sql: ${TABLE}.status_dscr ;;
  }

  dimension_group: statute_of_limitations {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.statute_of_limitations_date ;;
  }

  dimension: subcoverage_dscr {
    label: "Subcoverage Description"
    type: string
    sql: ${TABLE}.subcoverage_dscr ;;
  }

  dimension: subcoveragecode_id {
    type: number
    hidden: yes
    sql: ${TABLE}.subcoveragecode_id ;;
  }

  dimension: subexposure_dscr {
    label: "Subexposure Description"
    type: string
    sql: ${TABLE}.subexposure_dscr ;;
  }

  dimension: subro {
    type: string
    sql: ${TABLE}.subro ;;
  }

  dimension: users_id {
    type: number
    hidden: yes
    sql: ${TABLE}.users_id ;;
  }

  measure: count {
    type: count
    drill_fields: [display_name, users.users_id, users.login_name]
  }

  measure:  sum_indemnity_paid {
    type: sum
    label: "Total Indemnity Paid"
    sql: ${indemnity_paid} ;;
  }
  measure:  sum_indemnity_reserve {
    type:  sum
    label: "Total Indemnity Reserve"
    sql:  ${indemnity_reserve} ;;

  }
  measure: sum_total_indemnity_incurred{
    type: number
    label: "Total Indemnity Incurred"
    sql: ${sum_indemnity_paid} + ${sum_indemnity_reserve};;
  }

  measure:  sum_expense_paid {
    type: sum
    label: "Total Expense Paid"
    sql: ${expense_paid} ;;
  }

  measure:  sum_expense_reserve {
    type:  sum
    label: "Total Expense Reserve"
    sql:  ${expense_reserve} ;;

  }

  measure:  sum_expense_recovery {
    type:  sum
    label: "Total Expense Recovery"
    sql:  ${expense_recovery} ;;

  }

  measure:  sum_alae_paid {
    type: sum
    label: "Total Alae Paid"
    sql: ${alae_paid} ;;
  }

  measure:  sum_alae_reserve {
    type: sum
    label: "Total Alae Reserve"
    sql: ${alae_reserve} ;;
  }
}
