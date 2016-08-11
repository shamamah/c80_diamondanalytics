- view: driver
  sql_table_name: dbo.Driver
  fields:

  - dimension: compound_primary_key
    hidden: true
    primary_key: true
    sql: CONCAT(${TABLE}.policy_id, '  ', ${TABLE}.policyimage_num, '  ', ${TABLE}.driver_num)
    
  - dimension: policy_id
    hidden: true
    type: number
    sql: ${TABLE}.policy_id
    
  - dimension: policyimage_num
    hidden: true
    type: number
    sql: ${TABLE}.policyimage_num
    
  - dimension: driver_num
    label: 'Number'
    type: number
    sql: ${TABLE}.driver_num
    
  - dimension: detailstatuscode_id
    hidden: true
    type: number
    sql: ${TABLE}.detailstatuscode_id