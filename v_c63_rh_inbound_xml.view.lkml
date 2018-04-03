view: v_c63_rh_inbound_xml {
  sql_table_name: dbo.vC63_RH_InboundXML ;;

  dimension: cea_policystatuscode_id {
    hidden: yes
    type: number
    sql: ${TABLE}.CEA_policystatuscode_id ;;
  }

  dimension: cea_transtype_id {
    hidden: yes
    type: number
    sql: ${TABLE}.CEA_transtype_id ;;
  }

  dimension: cea_xml_id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.CEA_xml_id ;;
  }

  dimension: company_id {
    hidden: yes
    type: number
    sql: ${TABLE}.company_id ;;
  }

  dimension: companion_policy_number {
    type: string
    sql: ${TABLE}.companion_policy_number ;;
  }

  dimension_group: file {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.file_date ;;
  }

  dimension: is_transaction_formsloaded {
    label: "Forms Loaded"
    type: yesno
    sql: ${TABLE}.is_transaction_formsloaded ;;
  }

  dimension: is_transaction_rated {
    label: "Rated"
    type: yesno
    sql: ${TABLE}.is_transaction_rated ;;
  }

  dimension: is_transaction_submitted {
    label: "Submitted"
    type: yesno
    sql: ${TABLE}.is_transaction_submitted ;;
  }

  dimension: originaltransactiontype {
    hidden: yes
    type: string
    sql: ${TABLE}.originaltransactiontype ;;
  }

  dimension_group: policy_effective {
    hidden: yes
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.policy_effective_date ;;
  }

  dimension_group: policy_expiration {
    hidden: yes
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.policy_expiration_date ;;
  }

  dimension: policy_id {
    hidden: yes
    type: number
    sql: ${TABLE}.policy_id ;;
  }

  dimension: policyimage_num {
    hidden: yes
    type: number
    sql: ${TABLE}.policyimage_num ;;
  }

  dimension: proccessingstatus {
    label: "Processing Status"
    type: string
    sql: ${TABLE}.proccessingstatus ;;
  }

  dimension_group: processed {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.processed_date ;;
  }

  dimension: programtype_id {
    label: "Program Type"
    type: number
    sql: ${TABLE}.programtype_id ;;
  }

  dimension: transactiontype {
    label: "Transaction Type"
    type: string
    sql: ${TABLE}.transactiontype ;;
  }

  measure: count {
    type: count
  }

  measure: avg_days_to_process {
    #hidden: true
    label: "Average Days to Process"
    type: average_distinct
    value_format: "0.#"
    sql_distinct_key: ${cea_xml_id} ;;
    sql: DateDiff(d,${file_date},${processed_date}) ;;
  }
}
