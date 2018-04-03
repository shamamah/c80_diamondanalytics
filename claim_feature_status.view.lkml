view: claim_feature_status {
  sql_table_name: dbo.ClaimFeatureStatus ;;

  dimension: claimfeaturestatus_id {
    type: number
    sql: ${TABLE}.claimfeaturestatus_id ;;
  }

  dimension: dscr {
    type: string
    sql: ${TABLE}.dscr ;;
  }

  dimension: enabled {
    type: string
    sql: ${TABLE}.enabled ;;
  }

  dimension_group: last_modified {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension_group: pcadded {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.pcadded_date ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
