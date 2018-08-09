view: v_claim_detail_transaction {
  sql_table_name: dbo.vClaimDetail_Transaction ;;

  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${claimcontrol_id},${claimant_num},${claimfeature_num},${claimtransaction_num}) ;;
  }

  dimension_group: added {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.added_date ;;
  }

  dimension: adjust_alae_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.adjust_alae_paid ;;
  }

  dimension: adjust_alae_reserve {
    type: number
    sql: ${TABLE}.adjust_alae_reserve ;;
  }

  dimension: adjust_ant_expense_recovery {
    type: number
    sql: ${TABLE}.adjust_ant_expense_recovery ;;
  }

  dimension: adjust_ant_other_recovery {
    type: number
    sql: ${TABLE}.adjust_ant_other_recovery ;;
  }

  dimension: adjust_ant_salvage {
    type: number
    sql: ${TABLE}.adjust_ant_salvage ;;
  }

  dimension: adjust_ant_subro {
    type: number
    sql: ${TABLE}.adjust_ant_subro ;;
  }

  dimension: adjust_expense_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.adjust_expense_paid ;;
  }

  dimension: adjust_expense_recovery {
    type: number
    sql: ${TABLE}.adjust_expense_recovery ;;
  }

  dimension: adjust_expense_reserve {
    type: number
    sql: ${TABLE}.adjust_expense_reserve ;;
  }

  dimension: adjust_indemnity_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.adjust_indemnity_paid ;;
  }

  dimension: adjust_indemnity_reserve {
    type: number
    sql: ${TABLE}.adjust_indemnity_reserve ;;
  }

  dimension: adjust_other_recovery {
    type: number
    sql: ${TABLE}.adjust_other_recovery ;;
  }

  dimension: adjust_salvage {
    type: number
    sql: ${TABLE}.adjust_salvage ;;
  }

  dimension: adjust_subro {
    type: number
    sql: ${TABLE}.adjust_subro ;;
  }

  dimension: amount {
    type: string
    sql: ${TABLE}.amount ;;
  }

  dimension: approvedby_user_name {
    label: "Approved by User Name"
    type: string
    sql: ${TABLE}.approvedby_user_name ;;
  }

  dimension: bulk_check {
    type: string
    sql: ${TABLE}.bulk_check ;;
  }

  dimension: cat_dscr {
    label: "Catastrophe Description"
    type: string
    sql: ${TABLE}.cat_dscr ;;
  }

  dimension: check_number {
    type: string
    sql: ${TABLE}.check_number ;;
  }

  dimension: claimant_num {
    type: number
    sql: ${TABLE}.claimant_num ;;
  }

  dimension: claimcontrol_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: claimfeature_num {
    label: "Claim Feature Number"
    type: number
    sql: ${TABLE}.claimfeature_num ;;
  }

  dimension: claimscheduledpaymentcycle_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimscheduledpaymentcycle_id ;;
  }

  dimension: claimstoppmt_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimstoppmt_id ;;
  }

  dimension: claimtransaction_num {
    label: "Claim Transaction Number"
    type: number
    sql: ${TABLE}.claimtransaction_num ;;
  }

  dimension: claimtransactioncategory_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimtransactioncategory_id ;;
  }

  dimension: claimtransactionsplit_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimtransactionsplit_num ;;
  }

  dimension: claimtransactionstatus_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimtransactionstatus_id ;;
  }

  dimension: claimtransactiontype_id {
    type: number
    hidden: yes
    sql: ${TABLE}.claimtransactiontype_id ;;
  }

  dimension_group: clearedbank {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.clearedbank_date ;;
  }

  dimension_group: eff {
    label: "Effective Date"
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.eff_date ;;
  }

  dimension: pay_to_the_order_of {
    type: string
    sql: ${TABLE}.pay_to_the_order_of ;;
  }

  dimension: pay_type {
    type: string
    sql: ${TABLE}.pay_type ;;
  }

  dimension_group: reconcile {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reconcile_date ;;
  }

  dimension: remark {
    type: string
    sql: ${TABLE}.remark ;;
  }

  dimension: reserve {
    type: string
    sql: ${TABLE}.reserve ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: type_dscr {
    label: "Type Description"
    type: string
    sql: ${TABLE}.type_dscr ;;
  }

  dimension: user_code {
    type: string
    hidden: yes
    sql: ${TABLE}.user_code ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.user_name ;;
  }

  dimension: view_only {
    type: string
    sql: ${TABLE}.view_only ;;
  }

  measure: count {
    type: count
    drill_fields: [user_name, approvedby_user_name]
  }
}
