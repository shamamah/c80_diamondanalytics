- view: policy
  sql_table_name: dbo.Policy
  fields:

  - dimension: policy_id
    hidden: true
    primary_key: true
    type: number
    sql: ${TABLE}.policy_id
    
  - dimension: policycurrentstatus_id
    hidden: true
    type: string
    sql: ${TABLE}.policycurrentstatus_id

  - dimension_group: cancel_date
    label: 'Cancellation'
    type: time
    timeframes: [date]
    sql: ${TABLE}.cancel_date

  - dimension: client_id
    type: number
    hidden: true
    sql: ${TABLE}.client_id

  - dimension: current_policy
    label: 'Number'
    type: string
    sql: ${TABLE}.current_policy

  - dimension_group: first_eff
    label: 'First Effective'
    type: time
    timeframes: [date]
    sql: ${TABLE}.first_eff_date

  - dimension_group: firstwritten
    label: 'First Written'
    type: time
    timeframes: [date]
    sql: ${TABLE}.firstwritten_date
    
  - dimension_group: first_exp
    label: 'First Expiration'
    type: time
    timeframes: [date]
    sql: ${TABLE}.first_exp_date
    
#  - measure: premium_chg_written
#    label: 'Written Premium Change'
#    type: sum
#    value_format_name: usd
#    sql: ${policy_image.premium_chg_written}

  - measure: count
    type: count
    drill_fields: [client.client_id]