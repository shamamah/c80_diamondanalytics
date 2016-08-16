- view: location_address
  sql_table_name: dbo.Address
  fields:

  - dimension: address_id
    primary_key: true
    hidden: true
    type: number
    sql: ${TABLE}.address_id

  - dimension: city
    type: string
    sql: ${TABLE}.city

  - dimension: county
    type: string
    sql: ${TABLE}.county

  - dimension: display_address
    type: string
    sql: ${TABLE}.display_address

  - dimension: policy_id
    hidden: true
    type: number
    sql: ${TABLE}.policy_id

  - dimension: policyimage_num
    hidden: true
    type: number
    sql: ${TABLE}.policyimage_num

  - dimension: state_id
    hidden: true
    type: number
    sql: ${TABLE}.state_id

  - dimension: zip
    type: zipcode
    sql: LEFT(${TABLE}.zip,5)



  

