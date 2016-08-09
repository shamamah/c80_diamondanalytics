- view: policy_status_code
  sql_table_name: dbo.PolicyStatusCode
  fields:

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_date

  - dimension_group: pcadded
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.pcadded_date

  - dimension: policystatuscode_id
    type: number
    sql: ${TABLE}.policystatuscode_id

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: []

