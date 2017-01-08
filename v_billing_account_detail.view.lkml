view: v_billing_account_detail {
  sql_table_name: dbo.vBillingAccountDetail ;;

  dimension: account_num {
    type: number
    sql: ${TABLE}.account_num ;;
  }

  dimension: agency_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.agency_id ;;
  }

  dimension: billingaccount_id {
    type: number
    sql: ${TABLE}.billingaccount_id ;;
  }

  dimension: billingpayplan_dscr {
    type: string
    sql: ${TABLE}.billingpayplan_dscr ;;
  }

  dimension: billingpayplantype_id {
    type: number
    sql: ${TABLE}.billingpayplantype_id ;;
  }

  dimension: billmethod_id {
    type: number
    sql: ${TABLE}.billmethod_id ;;
  }

  dimension: billto_id {
    type: number
    sql: ${TABLE}.billto_id ;;
  }

  dimension: cancelled {
    type: string
    sql: ${TABLE}.cancelled ;;
  }

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: current_policy {
    type: string
    sql: ${TABLE}.current_policy ;;
  }

  dimension_group: first_eff {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.first_eff_date ;;
  }

  dimension: locked {
    type: string
    sql: ${TABLE}.locked ;;
  }

  dimension: paymenttype_id {
    type: number
    sql: ${TABLE}.paymenttype_id ;;
  }

  dimension: policy_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policycurrentstatus_dscr {
    type: string
    sql: ${TABLE}.policycurrentstatus_dscr ;;
  }

  dimension: policycurrentstatus_id {
    type: number
    sql: ${TABLE}.policycurrentstatus_id ;;
  }

  dimension: policyimage_num {
    type: number
    sql: ${TABLE}.policyimage_num ;;
  }

  dimension: policystatuscode_id {
    type: number
    sql: ${TABLE}.policystatuscode_id ;;
  }

  dimension: rewrittenfrom_policy_id {
    type: number
    sql: ${TABLE}.rewrittenfrom_policy_id ;;
  }

  dimension: transtype_id {
    type: number
    sql: ${TABLE}.transtype_id ;;
  }

  measure: count {
    type: count
    drill_fields: [client.client_id, policy.rewrittenfrom_policy_id, agency.agency_id, agency.accounting_rep_name]
  }
}
