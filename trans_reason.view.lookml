- view: trans_reason
  sql_table_name: dbo.TransReason
  fields:

  - dimension: description
#    hidden: true
    label: 'Description'
    type: string
    sql: ${TABLE}.dscr

  - dimension: transreason_id
    hidden: true
    type: number
    sql: ${TABLE}.transreason_id

  - dimension: transtype_id
    hidden: true
    type: number
    sql: ${TABLE}.transtype_id

