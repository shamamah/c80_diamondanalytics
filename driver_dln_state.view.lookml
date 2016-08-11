- view: driver_dln_state
  sql_table_name: dbo.State
  fields:
  
  - dimension: state_id
    hidden: true
    primary_key: true
    type: number
    sql: ${TABLE}.state_id

  - dimension: state
    label: 'Drivers License State'
    type: string
    sql: ${TABLE}.state