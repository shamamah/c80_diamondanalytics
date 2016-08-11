- view: coverage_code
  sql_table_name: dbo.CoverageCode
  fields:

  - dimension: coveragecode
    label: 'Code'
    type: string
    sql: ${TABLE}.coveragecode

  - dimension: coveragecode_id
    hidden: true
    type: number
    sql: ${TABLE}.coveragecode_id

  - dimension: coveragetype
    label: 'Type'
    type: string
    sql: ${TABLE}.coveragetype

  - dimension: dscr
    label: 'Code Description'
    type: string
    sql: ${TABLE}.dscr