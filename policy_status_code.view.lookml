- view: policy_status_code
  sql_table_name: dbo.PolicyStatusCode
  fields:

  - dimension: description
    label: 'Description'
    type: string
    sql: ${TABLE}.description

  - dimension: policystatuscode_id
    hidden: true
    type: number
    sql: ${TABLE}.policystatuscode_id
