- view: policy_current_status
  sql_table_name: dbo.PolicyCurrentStatus
  fields:

  - dimension: description
    hidden: true
    type: string
    sql: ${TABLE}.description

  - dimension: policycurrentstatus_id
    hidden: true
    type: number
    sql: ${TABLE}.policycurrentstatus_id
