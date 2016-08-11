- view: coverage_limit
  sql_table_name: dbo.CoverageLimit
  fields:

  - dimension: coveragelimit_id
    hidden: true
    type: number
    sql: ${TABLE}.coveragelimit_id

  - dimension: deductible
    label: 'Deductible'
    type: number
    value_format_name: usd
    sql: ${TABLE}.deductible

  - dimension: dscr
    label: 'Limit Description'
    type: string
    sql: ${TABLE}.dscr

  - dimension: peroccur_limit
    label: 'Per Occurence Limit'
    type: number
    value_format_name: usd
    sql: ${TABLE}.peroccur_limit

  - dimension: perperson_limit
    label: 'Per Person Limit'
    type: number
    value_format_name: usd
    sql: ${TABLE}.perperson_limit