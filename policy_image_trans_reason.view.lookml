- view: policy_image_trans_reason
  label: 'Transaction Reason'
  sql_table_name: dbo.TransReason
  fields:

  - dimension: description
#     hidden: true
    label: 'Transaction Reason'
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

