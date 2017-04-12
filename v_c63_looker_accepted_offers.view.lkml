view: v_c63_looker_accepted_offers {
  sql_table_name: dbo.vC63_Looker_AcceptedOffers ;;

  dimension: policy_id {
    hidden:  yes
    type: number
    sql: ${TABLE}.policy_id ;;
  }

  measure: count {
    label: "Accepted Offer Count"
    type: count
    drill_fields: []
  }

}
