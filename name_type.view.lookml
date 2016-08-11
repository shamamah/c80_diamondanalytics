- view: name_type
  sql_table_name: dbo.NameType
  fields:

  - dimension: dscr
    hidden: true
    type: string
    sql: ${TABLE}.dscr

  - dimension: nametype_id
    hidden: true
    type: number
    sql: ${TABLE}.nametype_id

