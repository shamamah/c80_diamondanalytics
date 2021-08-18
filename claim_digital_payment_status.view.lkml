view: claim_digital_payment_status {
  sql_table_name: dbo.ClaimDigitalPaymentStatus ;;

  dimension: claimdigitalpaymentstatus_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.claimdigitalpaymentstatus_id ;;
  }

  dimension: dscr {
    label: "Digital Payment Status"
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

  measure: count {
    type: count
    drill_fields: []
  }
}
