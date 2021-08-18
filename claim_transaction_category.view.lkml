view: claim_transaction_category {
  sql_table_name: dbo.ClaimTransactionCategory ;;

  dimension: claimtransacationcategory_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.claimtransactioncategory_id ;;
  }

  dimension: claimfinancialcategory_id {
    hidden: yes
    type: number
    sql: ${TABLE}.claimfinancialcategory_id ;;
  }

  dimension: dscr {
    label: "Category"
    type: string
    sql: ${TABLE}.dscr ;;
  }
}
