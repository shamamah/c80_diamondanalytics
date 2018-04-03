view: v_c63_looker_offers {
  sql_table_name: dbo.vC63_Looker_Offers ;;

  dimension: policy_id {
    hidden: yes
    type: number
    primary_key: yes
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policycurrentstatus_id {
    hidden: yes
    type: number
    sql: ${TABLE}.policycurrentstatus_id;;
  }

  measure: offer_count {
    label: "Offer Count"
    type: count
    drill_fields: []
  }

  measure: accepted_offer_count {
    label: "Accepted Offer Count"
    type: count
    filters: {
      field: current_status.description
      value: "In-Force"
    }
  }

  measure: conversion_rate {
    type: number
    value_format_name: percent_2
    sql: (1.0*${accepted_offer_count})/NULLIF((1.0*${offer_count}),0) ;;

  }

}
