view: claim_exposure {
  sql_table_name: dbo.ClaimExposure ;;

  dimension_group: added {
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
    sql: ${TABLE}.added_date ;;
  }

  dimension: claimexposure_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.claimexposure_id ;;
  }

  dimension: default_subexposure_format {
    type: string
    sql: ${TABLE}.default_subexposure_format ;;
  }

  dimension: dscr {
    label: "Exposure"
    type: string
    sql: ${TABLE}.dscr ;;
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

  dimension_group: pcadded {
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

  dimension: subexposure_flag {
    type: number
    sql: ${TABLE}.subexposure_flag ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
