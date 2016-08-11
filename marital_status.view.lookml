- view: policy_holder_marital_status
  sql_table_name: dbo.MaritalStatus
  fields:

  - dimension: dscr
    type: string
    sql: ${TABLE}.dscr

  - dimension: maritalstatus_id
    hidden: true
    type: number
    sql: ${TABLE}.maritalstatus_id

