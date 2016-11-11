- view: v_billing_futures
  sql_table_name: dbo.vBillingFutures
  fields:

  - dimension: compound_primary_key
    primary_key: true
    hidden: true
    sql: CONCAT(${policy_id},${renewal_ver},${billinginstallment_num},${num})
    
  - dimension: amount
    type: string
    sql: ${TABLE}.amount

  - dimension: amountspread
    type: string
    sql: ${TABLE}.amountspread

  - dimension: billingchargescreditstype_id
    type: number
    sql: ${TABLE}.billingchargescreditstype_id

  - dimension: billingchargetypecategory_dscr
    type: string
    sql: ${TABLE}.billingchargetypecategory_dscr

  - dimension: billingchargetypecategory_id
    type: number
    sql: ${TABLE}.billingchargetypecategory_id

  - dimension: billingfuturecash_num
    type: number
    sql: ${TABLE}.billingfuturecash_num

  - dimension: billinginstallment_num
    type: number
    sql: ${TABLE}.billinginstallment_num

  - dimension: dscr
    type: string
    sql: ${TABLE}.dscr

  - dimension_group: due
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.due_date

  - dimension: num
    type: number
    sql: ${TABLE}.num

  - dimension: packagepart_num
    type: number
    sql: ${TABLE}.packagepart_num

  - dimension: policy_id
    type: number
    # hidden: true
    sql: ${TABLE}.policy_id

  - dimension: renewal_ver
    type: string
    sql: ${TABLE}.renewal_ver

  - dimension: tax_amount
    type: string
    sql: ${TABLE}.tax_amount

  - dimension: tax_rate
    type: string
    sql: ${TABLE}.tax_rate

  - dimension: total
    type: string
    sql: ${TABLE}.total

  - dimension_group: tran
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.tran_date

  - measure: count
    type: count
    drill_fields: [policy.rewrittenfrom_policy_id]

