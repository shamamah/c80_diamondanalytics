- view: policy_image_attachment_link
  sql_table_name: dbo.PolicyImageAttachmentLink
  fields:

  - dimension: attachment_id
    type: number
    hidden: true
    sql: ${TABLE}.attachment_id

  - dimension: policy_id
    type: number
    hidden: true
    sql: ${TABLE}.policy_id

  - dimension: policyimage_num
    type: number
    hidden: true
    sql: ${TABLE}.policyimage_num

  - measure: count
    label: 'Attachment Count'
    type: count

