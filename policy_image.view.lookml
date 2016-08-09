- view: policy_image
  sql_table_name: dbo.PolicyImage
  fields:

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

  - dimension_group: eff
    hidden: true
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.eff_date

  - dimension_group: exp
    hidden: true
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.exp_date

  - dimension: policy
    hidden: true
    type: string
    sql: ${TABLE}.policy

  - dimension: policy_id
    hidden: true
    type: number
    sql: ${TABLE}.policy_id

  - dimension: policyimage_num
    hidden: true
    type: number
    sql: ${TABLE}.policyimage_num

  - dimension: premium_chg_written
    hidden: true
    type: string
    sql: ${TABLE}.premium_chg_written

  - dimension: premium_written
    hidden: true
    type: string
    sql: ${TABLE}.premium_written

  - dimension: pure_newbusiness
    hidden: true
    type: string
    sql: ${TABLE}.pure_newbusiness

  - dimension: renewal_ver
    hidden: true
    type: number
    sql: ${TABLE}.renewal_ver

  - dimension_group: teff
    hidden: true
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.teff_date

  - dimension_group: texp
    hidden: true
    type: time
    timeframes: [date, week, month]
    sql: ${TABLE}.texp_date

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
