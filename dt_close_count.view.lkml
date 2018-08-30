view: dt_close_count {
  derived_table: {
    sql: select count(cc.claimcontrol_id) as CloseCount, cc.claimcontrol_id
      from ClaimControl cc
        left outer join ClaimControlActivity cca on cc.claimcontrol_id = cca.claimcontrol_id
      where cca.claimactivitycode_id = 2
      group by cc.claimcontrol_id
 ;;
  }

#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }

  dimension: close_count {
    label: "Close Count"
    view_label: "Claim"
    type: number
    sql: ${TABLE}.CloseCount ;;
  }

  dimension: claimcontrol_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

#   set: detail {
#     fields: [close_count, claimcontrol_id]
#   }
}
