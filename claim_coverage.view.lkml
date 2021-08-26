view: claim_coverage {
  sql_table_name: dbo.ClaimCoverage ;;

  dimension: compound_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${claimcontrol_id},' ', ${claimexposure_id},' ',${claimsubexposure_num},' ',${claimcoverage_num}) ;;
  }

  dimension: claimcontrol_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: claimexposure_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimexposure_id ;;
  }

  dimension: claimsubexposure_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimsubexposure_num ;;
  }

  dimension: claimcoverage_num {
    hidden: yes
    type: number
    sql: ${TABLE}.claimcoverage_num ;;
  }


  ####--------------------------
  dimension_group: added {
    type: time
    timeframes: [
      date,
      month,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.added_date ;;
  }

  dimension: asl_id {
    hidden: yes
    type: number
    sql: ${TABLE}.asl_id ;;
  }

  dimension: calculate_deductible {
    hidden: yes
    type: string
    sql: ${TABLE}.calculate_deductible ;;
  }

  dimension: coinsurance_percent {
    hidden: yes
    type: number
    sql: ${TABLE}.coinsurance_percent ;;
  }

  dimension: coverage_limitations {
    hidden: yes
    type: string
    sql: ${TABLE}.coverage_limitations ;;
  }

  dimension: coverage_num {
    hidden: yes
    type: number
    sql: ${TABLE}.coverage_num ;;
  }

  dimension: coveragecode_id {
    hidden: yes
    type: number
    sql: ${TABLE}.coveragecode_id ;;
  }

  dimension: deductible_dscr {
    label: "Deductible"
    type: string
    sql: ${TABLE}.deductible_dscr ;;
  }

  dimension_group: eff {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.eff_date ;;
  }

  dimension_group: exp {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.exp_date ;;
  }

  dimension: external_coverage_identifier {
    hidden: yes
    type: string
    sql: ${TABLE}.external_coverage_identifier ;;
  }

  dimension: external_unit_identifier {
    hidden: yes
    type: string
    sql: ${TABLE}.external_unit_identifier ;;
  }

  dimension: has_coverage {
    label: "Has Coverage (Yes/No)"
    type: string
    sql: case when ${TABLE}.has_coverage = 'true' then 'Yes' else
      (case when ${TABLE}.has_coverage = 'false' then 'No' else NULL end) end ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: limit_dscr {
    label: "Limit"
    type: string
    sql: ${TABLE}.limit_dscr ;;
  }

  dimension_group: pcadded {
    hidden: yes
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.pcadded_date ;;
  }

  dimension: record_only {
    hidden: yes
    type: string
    sql: ${TABLE}.record_only ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
