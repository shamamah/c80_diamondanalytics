- view: sex
  sql_table_name: dbo.Sex
  fields:

  - dimension: sex_id
    hidden: true
    primary_key: true
    type: number
    sql: ${TABLE}.sex_id

  - dimension: dscr
    label: 'Sex'
    view_label: 'Policy Holder'
    type: string
    sql: ${TABLE}.dscr