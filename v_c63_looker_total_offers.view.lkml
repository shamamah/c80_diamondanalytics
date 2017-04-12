view: v_c63_looker_total_offers {
  sql_table_name: dbo.vC63_Looker_TotalOffers ;;

  dimension: policy_id {
    hidden: yes
    type: number
    sql: ${TABLE}.policy_id ;;
  }

  measure: count {
    label: "Offer Count"
    type: count
    drill_fields: []
  }
}
