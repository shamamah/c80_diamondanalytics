- view: name
  sql_table_name: dbo.Name
  fields:

  - dimension: name_id
    hidden: true
    primary_key: true
    type: number
    sql: ${TABLE}.name_id

  - dimension_group: birth
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.birth_date

  - dimension: commercial_name1
    type: string
    sql: ${TABLE}.commercial_name1

  - dimension: commercial_name2
    type: string
    sql: ${TABLE}.commercial_name2

  - dimension: display_name
    type: string
    sql: ${TABLE}.display_name

  - dimension: dln
    type: string
    sql: ${TABLE}.dln

  - dimension_group: dln
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dln_date

  - dimension: dlstate_id
    type: number
    sql: ${TABLE}.dlstate_id

  - dimension: doing_business_as
    type: string
    sql: ${TABLE}.doing_business_as

  - dimension: entitytype_id
    type: number
    sql: ${TABLE}.entitytype_id

  - dimension: first_name
    type: string
    sql: ${TABLE}.first_name

  - dimension: health_insurance_claim_number
    type: string
    sql: ${TABLE}.health_insurance_claim_number

  - dimension_group: last_modified
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_modified_date

  - dimension: last_name
    type: string
    sql: ${TABLE}.last_name

  - dimension: maritalstatus_id
    type: number
    sql: ${TABLE}.maritalstatus_id

  - dimension: middle_name
    type: string
    sql: ${TABLE}.middle_name

  - dimension: naics_code
    type: string
    sql: ${TABLE}.naics_code

  - dimension: name_display_num
    type: number
    sql: ${TABLE}.name_display_num

  - dimension: name_num
    type: number
    sql: ${TABLE}.name_num

  - dimension: nameaddresssource_id
    type: number
    sql: ${TABLE}.nameaddresssource_id

  - dimension: nametype_id
    type: number
    sql: ${TABLE}.nametype_id

  - dimension: sex_id
    type: number
    # hidden: true
    sql: ${TABLE}.sex_id