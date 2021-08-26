view: asl {
  sql_table_name: dbo.ASL ;;
  drill_fields: [asl_id]

  dimension: asl_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.asl_id ;;
  }

  dimension: asl {
    label: "ASL Code"
    type: string
    sql: ${TABLE}.asl ;;
  }

  dimension: description {
    label: "ASL Description"
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: last_modified {
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
    sql: ${TABLE}.last_modified_date ;;
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

  dimension: status_id {
    hidden: yes
    type: number
    sql: ${TABLE}.status_id ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [asl_id]
  }
}
