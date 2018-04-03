view: v_c63_offer_conversion_rate {
  sql_table_name: dbo.vC63_OfferConversionRate ;;

  dimension: company_id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.company_id ;;
  }

  measure: in_force {
    label: "In-Force Policy Count"
    type: sum
    sql: ${TABLE}.InForce ;;
  }

  measure: total {
    label: "Total Policy Count"
    type: sum
    sql: ${TABLE}.Total ;;
  }

  measure: rate {
    label: "Conversion Rate"
    type: number
    value_format: "0.00%"
    sql: (${in_force} / ${total});;
  }

}
