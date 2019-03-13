view: dm_claim_company {
  sql_table_name: dbo.ClaimCompany ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: claim_id {
    hidden: yes
    type: number
    sql: ${TABLE}.ClaimId ;;
  }

  dimension: company_code {
    label: "Company Code"
    type: string
    sql: ${TABLE}.CompanyCode ;;
  }

  dimension: lob {
    label: "LOB"
    type: string
    sql: ${TABLE}.LOB ;;
  }

  dimension: catcode {
    hidden: yes
    label: "CAT Code"
    type: string
    sql: ${TABLE}.CATCode ;;
  }

  dimension: cl_cat_code {
    label: "CAT Code"
    type: string
    sql: ${TABLE}.ClCATCode ;;
  }

  dimension: adjustment_type {
    hidden: yes
    label: "Adjustment Type"
    type: string
    sql: ${TABLE}.AdjustmentType ;;
  }

  dimension: cl_adjustment_type {
    label: "Adjustment Type"
    type: string
    sql: ${TABLE}.ClAdjustmentType ;;
  }

  dimension: lobcode {
    label: "LOB Code"
    type: string
    sql: ${TABLE}.LOBCode ;;
  }

  dimension: isocode {
    label: "ISO Code"
    type: string
    sql: ${TABLE}.ISOCode ;;
  }

  dimension: cause_code {
    label: "Cause Code"
    type: string
    sql: ${TABLE}.CauseCode ;;
  }

#   measure: count {
#     type: count
#     drill_fields: [id]
#   }
}
