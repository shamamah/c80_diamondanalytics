- view: version
  sql_table_name: dbo.vVersion
  fields:

  - dimension: companystatelob_id
    hidden: true
    type: number
    sql: ${TABLE}.companystatelob_id

  - dimension: version_id
    hidden: true
    type: number
    sql: ${TABLE}.version_id
