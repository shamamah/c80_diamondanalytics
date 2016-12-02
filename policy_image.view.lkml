view: policy_image {
  sql_table_name: dbo.PolicyImage ;;

  dimension: compound_primary_key {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${policy_id}, '  ', ${policyimage_num}) ;;
  }

  dimension: agency_id {
    hidden: yes
    type: number
    sql: ${TABLE}.agency_id ;;
  }

  dimension: agencyproducer_id {
    hidden: yes
    type: number
    sql: ${TABLE}.agencyproducer_id ;;
  }

  dimension: current_payplan_id {
    hidden: yes
    type: number
    sql: ${TABLE}.current_payplan_id ;;
  }

  dimension: policy {
    hidden: yes
    type: string
    sql: ${TABLE}.policy ;;
  }

  dimension: policy_id {
    hidden: yes
    type: number
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policystatuscode_id {
    hidden: yes
    type: number
    sql: ${TABLE}.policystatuscode_id ;;
  }

  dimension_group: trans {
    hidden: yes
    type: time
    timeframes: [raw, date, week, month, year]
    sql: ${TABLE}.trans_date ;;
  }

  dimension_group: added {
    hidden: yes
    type: time
    timeframes: [raw, date, week, month, year]
    sql: ${TABLE}.added_date ;;
  }

  dimension: days_from_offer_generation_to_policy_issue {
    type: number
    sql: DATEDIFF(day,${added_raw}, ${trans_raw}) ;;
  }

  dimension: days_from_offer_generation_to_policy_issue_tier {
    type: tier
    tiers: [0, 30, 60, 90]
    sql: ${days_from_offer_generation_to_policy_issue} ;;
  }

  #    P.policycurrenstatus = In-Force AND PIM.policyimage_num = 1

  dimension: transreason_id {
    hidden: yes
    type: number
    sql: ${TABLE}.transreason_id ;;
  }

  dimension: transtype_id {
    hidden: yes
    type: number
    sql: ${TABLE}.transtype_id ;;
  }

  dimension: version_id {
    hidden: yes
    type: number
    sql: ${TABLE}.version_id ;;
  }

  dimension: trans_users_id {
    hidden: yes
    type: number
    sql: ${TABLE}.trans_users_id ;;
  }

  dimension: policyimage_num {
    label: "Image Number"
    type: string
    sql: ${TABLE}.policyimage_num ;;
  }

  dimension: pure_newbusiness {
    label: "Pure New Business"
    type: yesno
    sql: ${TABLE}.pure_newbusiness ;;
  }

  dimension: renewal_ver {
    label: "Renewal Version"
    type: string
    sql: ${TABLE}.renewal_ver ;;
  }

  # effective_date, effective_month, etc.
  dimension_group: eff {
    label: "Effective"
    type: time
    timeframes: [date, month]
    sql: ${TABLE}.eff_date ;;
  }

  dimension_group: exp {
    label: "Expiration"
    type: time
    timeframes: [date]
    sql: ${TABLE}.exp_date ;;
  }

  dimension_group: teff {
    label: "Transaction Effective"
    type: time
    timeframes: [date]
    sql: ${TABLE}.teff_date ;;
  }

  dimension_group: texp {
    label: "Transaction Expiration"
    type: time
    timeframes: [date]
    sql: ${TABLE}.texp_date ;;
  }

  dimension_group: trans_date {
    label: "Transaction"
    type: time
    timeframes: [date, week]
    sql: ${TABLE}.trans_date ;;
  }

  dimension: trans_remark {
    label: "Transaction Remark"
    type: string
    sql: ${TABLE}.trans_remark ;;
  }

  dimension: premium_written {
    label: "Written Premium"
    type: number
    value_format_name: usd
    sql: ${TABLE}.premium_written ;;
  }

  dimension: premium_fullterm {
    label: "Fullterm Premium"
    type: number
    value_format_name: usd
    sql: ${TABLE}.premium_fullterm ;;
  }

  dimension: premium_chg_written {
    hidden: yes
    type: number
    sql: ${TABLE}.premium_chg_written ;;
  }

  dimension: premium_chg_fullterm {
    hidden: yes
    type: number
    sql: ${TABLE}.premium_chg_fullterm ;;
  }

  dimension: days_to_convert {
    label: "Days to Convert"
    type: number
    sql: DateDiff(d,${added_date},${trans_date}) ;;
  }

  measure: count {
    type: count
    drill_fields: [client.client_id]
  }

  dimension: days_to_convert_tier {
    label: "Days to Convert - Tier"
    type: tier
    style: integer
    tiers: [0, 31, 61, 91, 365]
    sql: ${days_to_convert} ;;
  }

  measure: average_days_from_offer_generation_to_policy_issue {
    type: average
    sql: ${days_from_offer_generation_to_policy_issue} ;;
    value_format_name: decimal_2
  }

  measure: premium_chg_written_sum {
    #hidden: true
    label: "Written Premium Change"
    type: sum_distinct
    value_format_name: usd
    sql_distinct_key: ${compound_primary_key} ;;
    sql: ${premium_chg_written} ;;
  }

  measure: premium_chg_fullterm_sum {
    #hidden: true
    label: "Fullterm Premium Change"
    type: sum_distinct
    value_format_name: usd
    sql_distinct_key: ${compound_primary_key} ;;
    sql: ${premium_chg_fullterm} ;;
  }

  measure: avg_days_to_convert {
    #hidden: true
    label: "Average Days to Convert"
    type: average_distinct
    value_format: "0.#"
    sql_distinct_key: ${compound_primary_key} ;;
    sql: DateDiff(d,${added_date},${trans_date}) ;;
  }
}
