- view: policy_image
  sql_table_name: dbo.PolicyImage
  fields:

  - dimension: compound_primary_key
    hidden: true
    primary_key: true
    sql: CONCAT(${TABLE}.policy_id, '  ', ${TABLE}.policyimage_num)

  - dimension: agency_id
    hidden: true
    type: number
    sql: ${TABLE}.agency_id

  - dimension: agencyproducer_id
    hidden: true
    type: number
    sql: ${TABLE}.agencyproducer_id

  - dimension: current_payplan_id
    hidden: true
    type: number
    sql: ${TABLE}.current_payplan_id

  - dimension: policy
    hidden: true
    type: string
    sql: ${TABLE}.policy

  - dimension: policy_id
    hidden: true
    type: number
    sql: ${TABLE}.policy_id

  - dimension_group: trans_date
    hidden: true
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.trans_date

  - dimension: trans_remark
    hidden: true
    type: string
    sql: ${TABLE}.trans_remark

  - dimension: transreason_id
    hidden: true
    type: number
    sql: ${TABLE}.transreason_id

  - dimension: transtype_id
    hidden: true
    type: number
    sql: ${TABLE}.transtype_id
    
  - dimension: version_id
    hidden: true
    type: number
    sql: ${TABLE}.version_id

  - dimension: policyimage_num
    label: 'Image Number'
    type: string
    sql: ${TABLE}.policyimage_num

  - dimension: pure_newbusiness
    label : 'Pure New Business'
    type: string
    sql: ${TABLE}.pure_newbusiness
    
  - dimension: renewal_ver
    label : 'Renewal Version'
    type: string
    sql: ${TABLE}.renewal_ver

  - dimension: eff # effective_date, effective_month, etc.
    label: 'Effective'
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.eff_date   

  - dimension: exp
    label: 'Expiration'
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.exp_date
    
  - dimension: teff
    label: 'Transaction Effective'
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.teff_date
    
  - dimension: texp
    label: 'Transaction Expiration'
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.texp_date
    
  - dimension: trans
    label: 'Transaction'
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.trans_date
    
  - dimension: premium_chg_written
    hidden: true
    label: 'Written Premium Change'
    type: number
    sql: ${TABLE}.premium_chg_written
    
  - measure: premium_chg_written_sum
    #hidden: true
    label: 'Written Premium Change'
    type: sum_distinct
    value_format_name: usd
    sql_distinct_key: ${compound_primary_key}
    sql: ${premium_chg_written}
    

