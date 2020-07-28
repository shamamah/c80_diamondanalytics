view: dt_coverage_a_limit {
  derived_table: {
    sql: select cc.claimcontrol_id, ccov.limit_dscr as 'Coverage A Limit'
      from ClaimControl cc
        inner join ClaimCoverage ccov on ccov.claimcontrol_id = cc.claimcontrol_id
        inner join CoverageCode covc on covc.coveragecode_id = ccov.coveragecode_id
      where
        covc.coveragecode = 'LOCA' --and ccov.limit_dscr NOT LIKE '%Limits%'
       ;;
  }

  dimension: claimcontrol_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: coverage_a_limit {
    type: string
    label: "Coverage A Limit"
    sql: ${TABLE}."Coverage A Limit" ;;
  }
}
