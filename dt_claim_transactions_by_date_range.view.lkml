view: dt_claim_transactions_by_date_range {
  derived_table: {
    sql: SELECT CTA2.*
      FROM dbo.vClaimTransaction_Adjust2 CTA2 WITH(NOLOCK)
      INNER JOIN dbo.ClaimTransaction CT WITH(NOLOCK)
             ON CTA2.claimcontrol_id = CT.claimcontrol_id
                    AND CTA2.claimant_num = CT.claimant_num
                    AND CTA2.claimfeature_num = CT.claimfeature_num
                    AND CTA2.claimtransaction_num = CT.claimtransaction_num
      INNER JOIN dbo.ClaimTransactionType CTT WITH(NOLOCK)
             ON CT.claimtransactiontype_id = CTT.claimtransactiontype_id
      WHERE CTA2.claimtransactionstatus_id IN (1, 4, 7)
             AND CTT.adjust_financials = 0
       ;;
  }

  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${claimcontrol_id},${claimant_num},${claimfeature_num},${claimtransaction_num}) ;;
  }

  dimension: policy_id {
    hidden: yes
    type: number
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policyimage_num {
    hidden: yes
    type: number
    sql: ${TABLE}.policyimage_num ;;
  }

  dimension: claimcontrol_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: claimant_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimant_num ;;
  }

  dimension: claimfeature_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimfeature_num ;;
  }

  dimension: claimtransaction_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimtransaction_num ;;
  }

  dimension: claimtransactiontype_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimtransactiontype_id ;;
  }

  dimension: claimtransactionstatus_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimtransactionstatus_id ;;
  }

  dimension: calc {
    hidden: yes
    type: string
    sql: ${TABLE}.calc ;;
  }

  dimension: amount {
    hidden: yes
    type: string
    sql: ${TABLE}.amount ;;
  }

  dimension: users_id {
    hidden: yes
    type: number
    sql: ${TABLE}.users_id ;;
  }

  dimension: adjust_indemnity_reserve {
    hidden: yes
    type: number
    sql: ${TABLE}.adjust_indemnity_reserve ;;
  }

  dimension: adjust_indemnity_paid {
    hidden: yes
    type: number
    sql: ${TABLE}.adjust_indemnity_paid ;;
  }

  dimension: adjust_expense_reserve {
    hidden: yes
    type: number
    sql: ${TABLE}.adjust_expense_reserve ;;
  }

  dimension: adjust_expense_paid {
    hidden: yes
    type: number
    sql: ${TABLE}.adjust_expense_paid ;;
  }

  dimension: adjust_alae_reserve {
    hidden: yes
    type: number
    sql: ${TABLE}.adjust_alae_reserve ;;
  }

  dimension: adjust_alae_paid {
    hidden: yes
    type: number
    sql: ${TABLE}.adjust_alae_paid ;;
  }

  dimension: adjust_expense_recovery {
    hidden: yes
    type: number
    sql: ${TABLE}.adjust_expense_recovery ;;
  }

  dimension: adjust_ant_expense_recovery {
    hidden: yes
    type: number
    sql: ${TABLE}.adjust_ant_expense_recovery ;;
  }

  dimension: adjust_ant_salvage {
    hidden: yes
    type: number
    sql: ${TABLE}.adjust_ant_salvage ;;
  }

  dimension: adjust_salvage {
    hidden: yes
    type: number
    sql: ${TABLE}.adjust_salvage ;;
  }

  dimension: adjust_ant_subro {
    hidden: yes
    type: number
    sql: ${TABLE}.adjust_ant_subro ;;
  }

  dimension: adjust_subro {
    hidden: yes
    type: number
    sql: ${TABLE}.adjust_subro ;;
  }

  dimension: adjust_ant_other_recovery {
    hidden: yes
    type: number
    sql: ${TABLE}.adjust_ant_other_recovery ;;
  }

  dimension: adjust_other_recovery {
    hidden: yes
    type: number
    sql: ${TABLE}.adjust_other_recovery ;;
  }

  dimension: dim_indemnity_reserve {
    hidden: yes
    type: string
    sql: ${TABLE}.indemnity_reserve ;;
  }

  measure:  indemnity_reserve {
    label: "Loss Reserve"
    type: sum
    sql: ${dim_indemnity_reserve} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  dimension: dim_indemnity_paid {
    hidden: yes
    type: string
    sql: ${TABLE}.indemnity_paid ;;
  }

  measure:  indemnity_paid {
    label: "Loss Paid"
    type: sum
    sql: ${dim_indemnity_paid} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  dimension: dim_expense_reserve {
    hidden: yes
    type: string
    sql: ${TABLE}.expense_reserve ;;
  }

  measure:  expense_reserve {
    label: "AO Reserve"
    type: sum
    sql: ${dim_expense_reserve} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  dimension: dim_expense_paid {
    hidden: yes
    type: string
    sql: ${TABLE}.expense_paid ;;
  }

  measure:  expense_paid {
    label: "AO Paid"
    type: sum
    sql: ${dim_expense_paid} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  dimension: dim_alae_reserve {
    hidden: yes
    type: string
    sql: ${TABLE}.alae_reserve ;;
  }

  measure:  alae_reserve {
    label: "DCC Reserve"
    type: sum
    sql: ${dim_alae_reserve} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  dimension: dim_alae_paid {
    hidden: yes
    type: string
    sql: ${TABLE}.alae_paid ;;
  }

  measure:  alae_paid {
    label: "DCC Paid"
    type: sum
    sql: ${dim_alae_paid} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  dimension: expense_recovery {
    hidden: yes
    type: string
    sql: ${TABLE}.expense_recovery ;;
  }

  dimension: ant_expense_recovery {
    hidden: yes
    type: string
    sql: ${TABLE}.ant_expense_recovery ;;
  }

  dimension: ant_salvage {
    hidden: yes
    type: string
    sql: ${TABLE}.ant_salvage ;;
  }

  dimension: dim_salvage {
    hidden: yes
    type: string
    sql: ${TABLE}.salvage ;;
  }

  measure:  salvage {
    label: "Salvage"
    type: sum
    sql: ${dim_salvage} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  dimension: ant_subro {
    hidden: yes
    type: string
    sql: ${TABLE}.ant_subro ;;
  }

  dimension: dim_subro {
    hidden: yes
    type: string
    sql: ${TABLE}.subro ;;
  }

  measure:  subro {
    label: "Subro"
    type: sum
    sql: ${dim_subro} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  dimension: ant_other_recovery {
    hidden: yes
    type: string
    sql: ${TABLE}.ant_other_recovery ;;
  }

  dimension: other_recovery {
    hidden: yes
    type: string
    sql: ${TABLE}.other_recovery ;;
  }

  dimension: old_reserve {
    hidden: yes
    type: string
    sql: ${TABLE}.old_reserve ;;
  }

  dimension_group: eff_date {
    label: "As Of"
    type: time
    timeframes: [date]
    sql: ${TABLE}.eff_date ;;
  }

  dimension: added_date {
    hidden: yes
    type: date
    sql: ${TABLE}.added_date ;;
  }

  dimension_group: pcadded_date {
    hidden: yes
    type: time
    sql: ${TABLE}.pcadded_date ;;
  }

  dimension: report_payment {
    hidden: yes
    type: string
    sql: ${TABLE}.report_payment ;;
  }

  dimension: report_cash {
    hidden: yes
    type: string
    sql: ${TABLE}.report_cash ;;
  }

  dimension: claimscheduledpaymentcycle_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimscheduledpaymentcycle_id ;;
  }

  set: detail {

    fields: [
      claim_control.claim_number,
      claimant_num,
      claimfeature_num,
      claimtransaction_num,
      eff_date_date,
      indemnity_reserve,
      indemnity_paid,
      expense_reserve,
      expense_paid,
      alae_reserve,
      alae_paid,
      salvage,
      subro
    ]
  }

}
