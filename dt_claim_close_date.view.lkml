view: dt_claim_close_date {
  derived_table: {
    sql: select cca.claimcontrol_id, cca.dscr as claim_close_reason, max(convert(varchar, cca.pcadded_date, 101)) as claim_close_date
      from ClaimControlActivity cca
    where cca.claimactivitycode_id = 2
    group by cca.claimcontrol_id, cca.dscr
    ;;
  }

  dimension: claimcontrol_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: claim_close_reason {
    label: "Close Reason"
    type: string
    sql: ${TABLE}.claim_close_reason ;;
  }

  dimension: claim_close_date {
    label: "Close Date"
    type: string
    sql: ${TABLE}.claim_close_date ;;
  }
}
