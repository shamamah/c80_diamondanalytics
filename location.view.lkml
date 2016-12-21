view: location {
  sql_table_name: dbo.Location ;;

  dimension: compound_primary_key {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${TABLE}.policy_id, '  ', ${TABLE}.policyimage_num, '  ', ${TABLE}.location_num) ;;
  }

  dimension: policy_id {
    hidden: yes
    type: number
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policyimage_num {
    hidden: yes
    type: number
    sql: ${TABLE}.policyimage_num ;;
  }

  dimension: premium_chg_written {
    type: string
    sql: ${TABLE}.premium_chg_written ;;
  }

  dimension: premium_fullterm {
    type: string
    sql: ${TABLE}.premium_fullterm ;;
  }

  dimension: premium_normal {
    type: string
    sql: ${TABLE}.premium_normal ;;
  }

  dimension: premium_written {
    type: string
    sql: ${TABLE}.premium_written ;;
  }

  dimension: territory_num {
    type: number
    sql: ${TABLE}.territory_num ;;
  }

  dimension: year_built {
    type: number
    sql: ${TABLE}.year_built ;;
  }
  dimension: square_feet {
    type:  number
    sql: ${TABLE}.square_feet ;;
  }

  dimension: location_num {
    type: number
    sql: ${TABLE}.location_num ;;
  }

  dimension: detailstatuscode_id {
    hidden: yes
    type: number
    sql: ${TABLE}.detailstatuscode_id ;;
  }

  measure: premium_chg_written_sum {
    #hidden: true
    label: "Written Premium Change"
    type: sum_distinct
    value_format_name: usd
    sql_distinct_key: ${compound_primary_key} ;;
    sql: ${premium_chg_written} ;;
  }
}
