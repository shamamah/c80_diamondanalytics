- view: v_billing_cash_detail
  sql_table_name: dbo.vBillingCashDetail
  fields:
  - dimension: compound_primary_key
    primary_key: true
    hidden: true
    sql: CONCAT(${policy_id},${billingcash_num},${billingcashdetail_num}}
  
  - dimension_group: added
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.added_date

  - dimension: amount
    type: string
    sql: ${TABLE}.amount

  - dimension: billingaccount_payment
    type: string
    sql: ${TABLE}.billingaccount_payment

  - dimension: billingaccountcash_id
    type: number
    sql: ${TABLE}.billingaccountcash_id

  - dimension: billingactivityorder
    type: number
    sql: ${TABLE}.billingactivityorder

  - dimension: billingcash_num
    type: number
    sql: ${TABLE}.billingcash_num

  - dimension: billingcashdetail_num
    type: number
    sql: ${TABLE}.billingcashdetail_num

  - dimension: billingcashdetailtype_id
    type: number
    sql: ${TABLE}.billingcashdetailtype_id

  - dimension: billingcashinsource_id
    type: number
    sql: ${TABLE}.billingcashinsource_id

  - dimension: cashin_dscr
    type: string
    sql: ${TABLE}.cashin_dscr

  - dimension: dscr
    type: string
    sql: ${TABLE}.dscr

  - dimension: policy_id
    type: number
    # hidden: true
    sql: ${TABLE}.policy_id

  - dimension: renewal_ver
    type: number
    sql: ${TABLE}.renewal_ver

  - measure: count
    type: count
    drill_fields: [policy.rewrittenfrom_policy_id]

