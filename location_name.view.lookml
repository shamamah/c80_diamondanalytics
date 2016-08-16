- view: location_name
  label: 'Location'
  sql_table_name: dbo.vName
  fields:

  - dimension: name_id
    hidden: true
    primary_key: true
    type: number
    sql: ${TABLE}.name_id

  - dimension: display_name
    type: string
    sql: ${TABLE}.display_name

  - dimension: first_name
    label: 'First Name'
    type: string
    sql: ${TABLE}.first_name

  - dimension: last_name
    label: 'Last Name'
    type: string
    sql: ${TABLE}.last_name
  