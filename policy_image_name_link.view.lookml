- view: policy_image_name_link_policy_holder
  sql_table_name: dbo.PolicyImageNameLink
  fields:

  - dimension: name_id
    type: number
    hidden: true
    sql: ${TABLE}.name_id

  - dimension: nameaddresssource_id
    type: number
    hidden: true
    sql: ${TABLE}.nameaddresssource_id

  - dimension: policy_id
    type: number
    hidden: true
    sql: ${TABLE}.policy_id

  - dimension: policyimage_num
    hidden: true
    type: number
    sql: ${TABLE}.policyimage_num

