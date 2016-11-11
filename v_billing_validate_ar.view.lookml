- view: v_billing_validate_ar
  sql_table_name: dbo.vBillingValidateAR
  fields:

  - dimension: policy_id
    type: number
    # hidden: true
    sql: ${TABLE}.policy_id

  - measure: count
    type: count
    drill_fields: [policy.rewrittenfrom_policy_id]

