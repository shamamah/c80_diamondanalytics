- view: v_billing_cash
  sql_table_name: dbo.vBillingCash
  fields:

  - dimension: accountingbatch_id
    type: number
    sql: ${TABLE}.accountingbatch_id

  - dimension: accountingsuspendedcash_id
    type: number
    sql: ${TABLE}.accountingsuspendedcash_id

  - dimension_group: added
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.added_date

  - dimension: address_id
    type: number
    # hidden: true
    sql: ${TABLE}.address_id

  - dimension: adjust_num
    type: number
    sql: ${TABLE}.adjust_num

  - dimension: amount
    type: string
    sql: ${TABLE}.amount

  - dimension: approval_code
    type: string
    sql: ${TABLE}.approval_code

  - dimension: authresponse_code
    type: string
    sql: ${TABLE}.authresponse_code

  - dimension: authresponse_msg
    type: string
    sql: ${TABLE}.authresponse_msg

  - dimension: billingaccount_payment
    type: string
    sql: ${TABLE}.billingaccount_payment

  - dimension: billingaccountcash_id
    type: number
    sql: ${TABLE}.billingaccountcash_id

  - dimension: billingaccountinvoice_id
    type: number
    sql: ${TABLE}.billingaccountinvoice_id

  - dimension: billingaccountinvoice_num
    type: number
    sql: ${TABLE}.billingaccountinvoice_num

  - dimension: billingactivityorder
    type: number
    sql: ${TABLE}.billingactivityorder

  - dimension: billingcash_id
    type: number
    sql: ${TABLE}.billingcash_id

  - dimension: billingcash_num
    type: number
    sql: ${TABLE}.billingcash_num

  - dimension: billingcashinsource_id
    type: number
    sql: ${TABLE}.billingcashinsource_id

  - dimension: billingcashtype_id
    type: number
    sql: ${TABLE}.billingcashtype_id

  - dimension: billinglocation_id
    type: number
    sql: ${TABLE}.billinglocation_id

  - dimension: billingreason_id
    type: number
    sql: ${TABLE}.billingreason_id

  - dimension_group: check
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.check_date

  - dimension: check_num
    type: string
    sql: ${TABLE}.check_num

  - dimension: checkitem_id
    type: number
    sql: ${TABLE}.checkitem_id

  - dimension: checkpayeetype_id
    type: number
    sql: ${TABLE}.checkpayeetype_id

  - dimension: creditcardaccount_num
    type: string
    sql: ${TABLE}.creditcardaccount_num

  - dimension: creditcardtype_id
    type: number
    sql: ${TABLE}.creditcardtype_id

  - dimension: expiration_date
    type: string
    sql: ${TABLE}.expiration_date

  - dimension_group: export
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.export_date

  - dimension: exportstatus_id
    type: number
    sql: ${TABLE}.exportstatus_id

  - dimension: login_name
    type: string
    sql: ${TABLE}.login_name

  - dimension: mail_to_address
    type: string
    sql: ${TABLE}.mail_to_address

  - dimension: mail_to_name1
    type: string
    sql: ${TABLE}.mail_to_name1

  - dimension: mail_to_name2
    type: string
    sql: ${TABLE}.mail_to_name2

  - dimension: mail_to_type_id
    type: number
    sql: ${TABLE}.mail_to_type_id

  - dimension: name_id
    type: number
    # hidden: true
    sql: ${TABLE}.name_id

  - dimension: pay_to
    type: string
    sql: ${TABLE}.pay_to

  - dimension: paylinxtype_id
    type: number
    sql: ${TABLE}.paylinxtype_id

  - dimension: paymentprocessor_id
    type: number
    sql: ${TABLE}.paymentprocessor_id

  - dimension_group: pcadded
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.pcadded_date

  - dimension: peoplesoftstatus_dscr
    type: string
    sql: ${TABLE}.peoplesoftstatus_dscr

  - dimension: peoplesoftstatus_id
    type: number
    sql: ${TABLE}.peoplesoftstatus_id

  - dimension: policy_id
    type: number
    # hidden: true
    sql: ${TABLE}.policy_id

  - dimension: compound_primary_key
    type: string
    primary_key: true
    hidden: true
    sql: CONCAT(${policy_id},${billingcash_num},${billingactivityorder})
    
  - dimension: printprocess_id
    type: number
    sql: ${TABLE}.printprocess_id

  - dimension_group: prior_cancel
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.prior_cancel_date

  - dimension_group: prior_legal
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.prior_legal_date

  - dimension: sequence_number
    type: string
    sql: ${TABLE}.sequence_number

  - dimension: tax_amount
    type: string
    sql: ${TABLE}.tax_amount

  - dimension: tax_version
    type: number
    sql: ${TABLE}.tax_version

  - dimension: transfer_from_policy
    type: string
    sql: ${TABLE}.transfer_from_policy

  - dimension: transfer_from_policy_id
    type: number
    sql: ${TABLE}.transfer_from_policy_id

  - dimension: transfer_from_suspenseaccount_id
    type: number
    sql: ${TABLE}.transfer_from_suspenseaccount_id

  - dimension: transfer_num
    type: number
    sql: ${TABLE}.transfer_num

  - dimension: transfer_to_policy
    type: string
    sql: ${TABLE}.transfer_to_policy

  - dimension: transfer_to_policy_id
    type: number
    sql: ${TABLE}.transfer_to_policy_id

  - dimension: unapplied_amount
    type: string
    sql: ${TABLE}.unapplied_amount

  - dimension: users_id
    type: number
    # hidden: true
    sql: ${TABLE}.users_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - login_name
    - policy.rewrittenfrom_policy_id
    - users.users_id
    - users.login_name
    - name.name_id
    - name.display_name
    - name.sort_name
    - name.prefix_name
    - name.first_name
    - name.middle_name
    - name.last_name
    - name.suffix_name
    - address.address_id
    - address.street_name
    - address.ocean_name
    - address.bay_name
    - address.waterway_name
    - address.river_name
    - address.ocean_local_name
    - address.bay_local_name
    - address.waterway_local_name
    - address.river_local_name
    - address.waterbody_name
    - address.waterbody_local_name

