connection: "c72-datamart-prod"

# include all the views
include: "qb*.view"

fiscal_month_offset: 0
week_start_day: sunday

explore: qb_invoice {
  group_label: "Transcynd Analytics [Test]"
  label: "Financial (QuickBooks)"
  #persist_for: "4 hours"
  view_label: "Invoice"

  # access_filter: {
  #   field:company_state_lob.commercial_name1
  #   user_attribute:company_name
  # }

  #Exclude records without claim number
  # sql_always_where: ${claim_number} > ''
  #   AND {% condition dt_claim_transactions_as_of.as_of_date %} claim_control.reported_date {% endcondition %}
  #   ;;

  #Exclude records with status of 'Cancelled'
  #sql_always_where: ISNULL(dm_claim.CurrentClaimStatus,'') <> 'Cancelled' ;;

  #join: claim_type {
  #  type: inner
  #  relationship: one_to_many
  #  sql_on: ${claim_type.claimtype_id} = ${claim_control.claim_type_id} ;;
  #}

  join: qb_invoice_line {
    view_label: "Invoice Detail"
    type: left_outer
    relationship: one_to_many
    sql_on: ${qb_invoice.txn_id} = ${qb_invoice_line.txn_id} ;;
  }

}
