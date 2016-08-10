- view: current_status
  label: 'Policy Status'
  sql_table_name: dbo.PolicyCurrentStatus
  fields:

  - dimension: description
    label: 'Current Status'
    type: string
    sql: ${TABLE}.description

  - dimension: policycurrentstatus_id
    hidden: true
    type: number
    sql: ${TABLE}.policycurrentstatus_id
    
