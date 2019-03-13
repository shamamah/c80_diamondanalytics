view: dm_claim {
  sql_table_name: dbo.Claim ;;

  dimension: id {
    primary_key: yes
    hidden: no
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: source_system {
    label: "Source System"
    type: string
    sql: ${TABLE}.SourceSystem ;;
  }

  dimension: file_trac_claim_number {
    label: "FT Claim Number"
    type: string
    sql: ${TABLE}.FileTracClaimNumber ;;
  }

  dimension: file_trac_file_number {
    label: "FT File Number"
    type: string
    sql: ${TABLE}.FileTracFileNumber ;;
  }

  dimension: file_trac_claim_id {
    label: "FT Claim ID"
    type: number
    sql: ${TABLE}.FileTracClaimID ;;
  }

  dimension: internal_claim_id {
    label: "Internal Claim ID"
    type: number
    sql: ${TABLE}.InternalClaimID ;;
  }

  dimension: file_number {
    label: "File Number"
    type: string
    sql: ${TABLE}.FileNumber ;;
  }

  dimension: secondary_file_number {
    label: "Secondary File Number"
    type: string
    sql: ${TABLE}.SecondaryFileNumber ;;
  }

  dimension_group: date_of_loss {
    label: "Loss"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.DateOfLoss ;;
  }

  dimension: serious_claim {
    label: "Is Serious"
    type: string
    sql: case when ${TABLE}.SeriousClaim=0 then 'No' else 'Yes' end ;;
  }

  dimension: in_litigation {
    label: "Is Litigated"
    type: string
    sql: case when ${TABLE}.InLitigation=0 then 'No' else 'Yes' end ;;
  }

  dimension: loss_type {
    label: "Loss Type"
    type: string
    sql: ${TABLE}.LossType ;;
  }

  dimension: loss_unit {
    label: "Loss Unit"
    type: string
    sql: ${TABLE}.LossUnit ;;
  }

  dimension: loss_description {
    label: "Loss Description"
    type: string
    sql: ${TABLE}.LossDescription ;;
  }

  dimension: special_instructions {
    label: "Special Instructions"
    type: string
    sql: ${TABLE}.SpecialInstructions ;;
  }

  dimension_group: _inserted {
    hidden: yes
    type: time
    timeframes: [raw,time,date,week,month,quarter,year]
    sql: ${TABLE}._inserted ;;
  }

  dimension_group: _updated {
    hidden: yes
    type: time
    timeframes: [raw,time,date,week,month,quarter,year]
    sql: ${TABLE}._Updated ;;
  }

  dimension: active {
    hidden: yes
    label: "Is Active"
    type: string
    sql: case when ${TABLE}.Active in (0,1) then (case when ${TABLE}.Active=0 then 'No' else 'Yes' end) else 'N/A' end ;;
  }


  ####################
  ##  PERSONNEL    ##
  ####################

  dimension: adjuster_id {
    view_label: "Personnel-Adjuster"
    label: "ID"
    type: number
    sql: ${TABLE}.AdjusterID ;;
  }

  dimension: manager_id {
    view_label: "Personnel-Account Manager"
    label: "ID"
    type: number
    sql: ${TABLE}.ManagerID ;;
  }

  dimension: supervisor_id {
    view_label: "Personnel-QA"
    label: "ID"
    type: number
    sql: ${TABLE}.SupervisorID ;;
  }

  ####################
  ##  LOSS ADDRESS  ##
  ####################

  dimension: latitude {
    view_label: "Loss Address"
    label: "_Latitude"
    type: number
    sql: ${TABLE}.Latitude ;;
    value_format_name: decimal_4
  }

  dimension: longitude {
    view_label: "Loss Address"
    label: "_Longitude"
    type: number
    sql: ${TABLE}.Longitude ;;
    value_format_name: decimal_4
  }

  dimension: cl_loss_addr1 {
    view_label: "Loss Address"
    label: "Address 1"
    type: string
    sql: ${TABLE}.ClLossAddr1 ;;
  }

  dimension: cl_loss_addr2 {
    view_label: "Loss Address"
    label: "Address 2"
    type: string
    sql: ${TABLE}.ClLossAddr2 ;;
  }

  dimension: cl_loss_city {
    view_label: "Loss Address"
    label: "City"
    type: string
    sql: ${TABLE}.ClLossCity ;;
  }

  dimension: cl_loss_state {
    view_label: "Loss Address"
    label: "State"
    type: string
    sql: ${TABLE}.ClLossState ;;
  }

  dimension: cl_loss_zip {
    view_label: "Loss Address"
    label: "ZIP"
    type: zipcode
    sql: left(${TABLE}.ClLossZip,5) ;;
    #drill_fields: [detail*]
  }

  dimension: cl_loss_country {
    view_label: "Loss Address"
    label: "Country"
    type: string
    sql: ${TABLE}.ClLossCountry ;;
  }

  measure: count {
    type: count
    #drill_fields: [loss_addr1]
  }
}
