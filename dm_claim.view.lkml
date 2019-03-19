view: dm_claim {
  sql_table_name: dbo.Claim ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: source_system {
    label: "Source System"
    type: string
    sql: ${TABLE}.SourceSystem ;;
  }

  dimension: file_trac_claim_number {
    label: "Claim Number (FT)"
    type: string
    sql: ${TABLE}.FileTracClaimNumber ;;
    link: {
      label: "FileTrac"
      url: "{{ claim_url }}"
      #icon_url: "https://nebula.wsimg.com/16687cb1633052c29f20253d5d9fa127?AccessKeyId=48ECF6173621CE416A90&disposition=0&alloworigin=1"
      #icon_url: "https://nebula.wsimg.com/2709d29fe4874461ab934e380e4a3465?AccessKeyId=48ECF6173621CE416A90&disposition=0&alloworigin=1"
    }
  }

  dimension: file_trac_file_number {
    label: "File Number (Internal)"
    hidden: yes
    type: string
    sql: ${TABLE}.FileTracFileNumber ;;
  }

  dimension: file_trac_claim_id {
    label: "FT Claim ID"
    hidden: yes
    type: number
    sql: ${TABLE}.FileTracClaimID ;;
  }

  dimension: internal_claim_id {
    label: "Claim ID (Internal)"
    hidden: yes
    type: number
    sql: ${TABLE}.InternalClaimID ;;
  }

  dimension: claim_url {
    hidden: yes
    type: string
    sql: ${TABLE}.ClaimURL ;;
  }

  dimension: file_number {
    label: "File Number (FT)"
    type: string
    sql: ${TABLE}.FileNumber ;;
    link: {
      label: "FileTrac"
      url: "{{ claim_url }}"
      #icon_url: "https://nebula.wsimg.com/16687cb1633052c29f20253d5d9fa127?AccessKeyId=48ECF6173621CE416A90&disposition=0&alloworigin=1"
      #icon_url: "https://nebula.wsimg.com/2709d29fe4874461ab934e380e4a3465?AccessKeyId=48ECF6173621CE416A90&disposition=0&alloworigin=1"
    }
  }

  dimension: secondary_file_number {
    label: "File Number (Secondary)"
    hidden: yes
    type: string
    sql: ${TABLE}.SecondaryFileNumber ;;
  }

  dimension_group: loss_date {
    label: "Loss"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.LossDate ;;
  }

  dimension: loss_date_est {
    label: "Is Loss Date Estimated"
    type: string
    sql: case when ${TABLE}.LossDateEst=1 then 'Yes' else 'No' end ;;
  }

  dimension: serious_claim {
    label: "xIs Serious"
    type: string
    sql: case when ${TABLE}.SeriousClaim=1 then 'YEs' else 'No' end ;;
  }

  dimension: in_litigation {
    label: "Is Litigated"
    type: string
    sql: case when ${TABLE}.InLitigation=1 then 'Yes' else 'No' end ;;
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

  dimension: loaned_examiner{
    label: "Is Loaned Examiner"
    type: string
    sql: case when ${TABLE}.LoanedExaminer=1 then 'Yes' else 'No' end ;;
  }

  dimension: desk_adjustment {
    label: "xIs Desk Adjustment"
    type: string
    sql: case when ${TABLE}.DeskAdjustment=1 then 'Yes' else 'No' end ;;
  }

  dimension: BillingRecordOnly {
    label: "Is Billing Record"
    type: string
    sql: case when ${TABLE}.BillingRecordOnly=1 then 'Yes' else 'No' end ;;
  }

  dimension: claim_closed {
    label: "Is Closed"
    type: string
    sql: case when ${TABLE}.ClaimClosed=1 then 'Yes' else 'No' end ;;
  }

  dimension: re_open_count {
    label: "Re-Open Count"
    type: number
    sql: ${TABLE}.ReOpenCount ;;
  }

  dimension: current_claim_status{
    label: "Status (Current)"
    type: string
    sql: ${TABLE}.CurrentClaimStatus ;;
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
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      source_system,
      file_trac_claim_number,
      file_number,
      loss_date_date,
      loss_type,
      loss_unit,
      dm_claim_activity.received_date_date,
      current_claim_status,
      in_litigation,
      BillingRecordOnly,
      desk_adjustment,
      loaned_examiner
    ]

  }
}
