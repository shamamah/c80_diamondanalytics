- view: marital_status
  sql_table_name: dbo.MaritalStatus
  fields:

  - dimension: dscr
    view_label: 'Policy Holder'
    type: string
    sql: ${TABLE}.dscr

  - dimension: maritalstatus_id
    hidden: true
    type: number
    sql: ${TABLE}.maritalstatus_id

