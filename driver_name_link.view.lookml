- view: driver_name_link
  sql_table_name: dbo.DriverNameLink
  fields:

  - dimension: driver_num
    hidden: true
    type: number
    sql: ${TABLE}.driver_num

  - dimension: name_id
    hidden: true
    type: number
    sql: ${TABLE}.name_id

  - dimension: policy_id
    hidden: true
    type: number
    sql: ${TABLE}.policy_id

  - dimension: policyimage_num
    hidden: true
    type: number
    sql: ${TABLE}.policyimage_num