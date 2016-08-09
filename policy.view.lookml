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
    timeframes: [date, week, month]
    sql: ${TABLE}.cancel_date

  - dimension: client_id
    type: number
    hidden: true
    sql: ${TABLE}.client_id

  - dimension: current_policy
    label: 'Number'
    type: string
    sql: ${TABLE}.current_policy

  - dimension: policyimage_num
    label: 'Image Number'
    type: string
    sql: ${policy_image.policyimage_num}

  - dimension_group: first_eff
    label: 'First Effective'
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.first_eff_date

  - dimension_group: firstwritten
    label: 'First Written'
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.firstwritten_date
    
  - dimension_group: first_exp
    label: 'First Expiration'
    type: time
    timeframes: [date]
    sql: ${TABLE}.first_exp_date

  - dimension: current_status
    label: 'Current Status'
    type: string
    sql: ${policy_current_status.description}
    
  - dimension: eff
    label: 'Effective'
    type: time
    timeframes: [date, week, month]
    sql: ${policy_image.eff_date}    

  - dimension: exp
    label: 'Expiration'
    type: time
    timeframes: [date, week, month]
    sql: ${policy_image.exp_date} 
    
  - dimension: teff
    label: 'Transaction Effective'
    type: time
    timeframes: [date, week, month]
    sql: ${policy_image.teff_date}    

  - dimension: texp
    label: 'Transaction Expiration'
    type: time
    timeframes: [date, week, month]
    sql: ${policy_image.texp_date}       
    
  - dimension: trans_reason
    label: 'Transaction Reason'
    type: string
    sql: ${trans_reason.description}
    
  - dimension: trans_type
    label: 'Transaction Type'
    type: string
    sql: ${trans_type.description}    

  - dimension: pure_newbusiness
    label : 'Pure New Business'
    hidden: true
    type: string
    sql: ${policy_image.pure_newbusiness}

  - measure: premium_written
    label: 'Written Premium'
    type: sum
    sql: ${policy_image.premium_written}
    
  - measure: premium_chg_written
    label: 'Change in Written Premium'
    type: sum
    sql: ${policy_image.premium_chg_written}
    

