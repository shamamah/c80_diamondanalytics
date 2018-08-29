view: dt_reopen_count {
  derived_table: {
    sql: select (count(cc.claimcontrol_id)-1) as ReopenCount, cc.claimcontrol_id
      from ClaimControl cc
        left outer join ClaimControlActivity cca on cc.claimcontrol_id = cca.claimcontrol_id
      --where (select count(*) from claimcontrolactivity cca where cc.claimcontrol_id = cca.claimcontrol_id and cca.claimactivitycode_id = 1) > 0
      where cca.claimactivitycode_id = 1
      group by cc.claimcontrol_id
      --having (count(cc.claimcontrol_id)-1) > 0
      --order by cc.claimcontrol_id
       ;;
  }

#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }

  dimension: reopen_count {
    label: "Reopen Count"
    view_label: "Claim"
    type: number
    sql: ${TABLE}.ReopenCount ;;
  }

  dimension: claimcontrol_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

#   set: detail {
#     fields: [reopen_count, claimcontrol_id]
#   }
}
