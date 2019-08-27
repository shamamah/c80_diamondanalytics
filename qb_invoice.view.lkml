view: qb_invoice {
  sql_table_name: qb.Invoice ;;

  dimension: txn_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.TxnID ;;
  }

  dimension: applied_amount {
    label: "Applied Amount"
    hidden: yes
    type: number
    sql: ${TABLE}.AppliedAmount ;;
  }

  measure: total_applied_amount {
    label: "Total Applied Amount"
    type: sum
    value_format_name: usd
    sql: ${applied_amount} ;;
  }

  dimension: balance_remaining {
    label: "Balance Remaining"
    hidden: yes
    type: number
    sql: ${TABLE}.BalanceRemaining ;;
  }

  measure: total_balance_remaining {
    label: "Total Balance Remaining"
    type: sum
    value_format_name: usd
    sql: ${balance_remaining} ;;
  }

  dimension: class_ref_full_name {
    label: "zClass Ref Full Name"
    type: string
    sql: ${TABLE}.ClassRefFullName ;;
  }

  dimension: class_ref_list_id {
    label: "zClass Ref List ID"
    type: string
    sql: ${TABLE}.ClassRefListID ;;
  }

  dimension: company_code {
    label: "Company Code"
    type: string
    sql: ${TABLE}.CompanyCode ;;
  }

  dimension: customer_name {
    label: "Customer Name"
    type: string
    sql: ${TABLE}.CustomerName ;;
  }

  dimension: customer_ref_full_name {
    label: "zCustomer Ref Full Name"
    type: string
    sql: ${TABLE}.CustomerRefFullName ;;
  }

  dimension: customer_ref_list_id {
    label: "zCustomer Ref List ID"
    type: string
    sql: ${TABLE}.CustomerRefListID ;;
  }

  dimension: customer_sales_tax_code_ref_full_name {
    label: "zCustomer Sales Tax Code Ref Full Name"
    type: string
    sql: ${TABLE}.CustomerSalesTaxCodeRefFullName ;;
  }

  dimension: customer_tax_code_ref_list_id {
    label: "zCustomer Tax Code Ref List ID"
    type: string
    sql: ${TABLE}.CustomerTaxCodeRefListID ;;
  }

  dimension_group: due {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.DueDate ;;
  }

  dimension: file_trac_file_number {
    label: "FT File Number"
    type: string
    sql: ${TABLE}.FileTracFileNumber ;;
  }

  dimension: file_trac_invoice_number {
    label: "FT Invoice Number"
    type: string
    sql: ${TABLE}.FileTracInvoiceNumber ;;
  }

  dimension: is_paid {
    label: "Is Paid"
    type: string
    sql: case when ${TABLE}.IsPaid='true' then 'Yes' else 'No' End ;;
  }

  dimension: is_pending {
    label: "zIs Pending"
    type: string
    sql: case when ${TABLE}.IsPending='true' then 'Yes' else 'No' End ;;
  }

  dimension: is_tax_included {
    label: "zIs Tax Included"
    type: string
    sql: case when ${TABLE}.IsTaxIncluded='true' then 'Yes' else 'No' End ;;
  }

  dimension: item_sales_tax_ref_full_name {
    label: "zItem Sales Tax Ref Full Name"
    type: string
    sql: ${TABLE}.ItemSalesTaxRefFullName ;;
  }

  dimension: item_sales_tax_ref_list_id {
    label: "zItem Sales Tax Ref List ID"
    type: string
    sql: ${TABLE}.ItemSalesTaxRefListID ;;
  }

  dimension: memo {
    label: "zMemo"
    type: string
    sql: ${TABLE}.Memo ;;
  }

  dimension: memo_adjuster_name {
    label: "Adjuster Name (Memo)"
    type: string
    sql: ${TABLE}.MemoAdjusterName ;;
  }

  dimension: memo_claim_no {
    label: "Claim Number (Memo)"
    type: string
    sql: ${TABLE}.MemoClaimNo ;;
  }

  dimension: memo_client {
    label: "Client (Memo)"
    type: string
    sql: ${TABLE}.MemoClient ;;
  }

  dimension: memo_client_company {
    label: "zCustomer Name (Memo)"
    type: string
    sql: ${TABLE}.MemoClientCompany ;;
  }

  dimension: memo_file_no {
    label: "File Number (Memo)"
    type: string
    sql: ${TABLE}.MemoFileNo ;;
  }

  dimension: memo_insured_name {
    label: "Insured Name (Memo)"
    type: string
    sql: ${TABLE}.MemoInsuredName ;;
  }

  dimension: memo_loss_address {
    label: "Loss Address (Memo)"
    type: string
    sql: ${TABLE}.MemoLossAddress ;;
  }

  dimension: sales_tax_percentage {
    type: number
    value_format_name: percent_2
    sql: ${TABLE}.SalesTaxPercentage*0.01 ;;
  }

  dimension: sales_tax_total {
    hidden: yes
    label: "Sales Tax"
    type: number
    sql: ${TABLE}.SalesTaxTotal ;;
  }

  measure: total_sales_tax_total {
    label: "Total Sales Tax"
    type: sum
    value_format_name: usd
    sql: ${sales_tax_total} ;;
  }

  dimension: subtotal {
    hidden: yes
    label: "Subtotal"
    type: number
    sql: ${TABLE}.Subtotal ;;
  }

  measure: total_subtotal {
    label: "Total Subtotal"
    type: sum
    value_format_name: usd
    sql: ${subtotal} ;;
  }

  dimension: template_ref_full_name {
    type: string
    sql: ${TABLE}.TemplateRefFullName ;;
  }

  dimension_group: time_created {
    label: "Created"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.TimeCreated ;;
  }

  dimension_group: txn {
    label: "Transasction"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.TxnDate ;;
  }

  dimension: txn_number {
    label: "Transaction Number"
    type: number
    value_format_name: id
    sql: ${TABLE}.TxnNumber ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      txn_id,
      company_code,
      customer_name,
      file_trac_invoice_number,
      file_trac_file_number,
      due_date,
      is_paid,
      subtotal,
      applied_amount,
      balance_remaining
    ]
  }
}
