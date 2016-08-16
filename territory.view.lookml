- view: territory
  sql_table_name: dbo.Territory
  fields:

  - dimension: territory_id
    hidden: true
    primary_key: true
    type: number
    sql: ${TABLE}.territory_id

  - dimension: city
    type: string
    sql: ${TABLE}.city

  - dimension: county
    type: string
    sql: ${TABLE}.county

  - dimension: state
    type: string
    sql: ${TABLE}.state

  - dimension: territory_num
    hidden: true
    type: number
    sql: ${TABLE}.territory_num

  - dimension: zip
    type: string
    sql: ${TABLE}.zip
