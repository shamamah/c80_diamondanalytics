- view: policy_status_code
  sql_table_name: dbo.PolicyStatusCode
  fields:

  - dimension: description
    label: 'Status'
    type: string
    sql: ${TABLE}.description

  - dimension: policystatuscode_id
    hidden: true
    type: number
    sql: ${TABLE}.policystatuscode_id

  - dimension: status
    hidden: true
    type: string
    sql: ${TABLE}.status



