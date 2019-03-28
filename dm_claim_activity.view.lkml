view: dm_claim_activity {
  sql_table_name: dbo.ClaimActivity ;;

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

  dimension: first_close_est {
    view_label: "Claim Dates"
    label: "Is First Close Estimate"
    type: string
    sql: case when ${TABLE}.FirstCloseEst=1 then 'Yes' else 'No' end ;;
  }

  ############
  ##  DATE  ##
  ############

  dimension_group: received_date {
    view_label: "Claim Dates"
    label: "01 Received"
    type: time
    timeframes: [date,time,month,quarter,year]
    sql: ${TABLE}.ReceivedDate ;;
  }

  dimension_group: assigned_date {
    view_label: "Claim Dates"
    label: "02 Assigned"
    type: time
    timeframes: [date,time,month,quarter,year]
    sql: ${TABLE}.AssignedDate ;;
  }

  dimension_group: accepted_date {
    view_label: "Claim Dates"
    label: "03 Accepted"
    type: time
    timeframes: [date,time,month,quarter,year]
    sql: ${TABLE}.AcceptedDate ;;
  }

  dimension_group: contact_date {
    view_label: "Claim Dates"
    label: "04 Contact"
    type: time
    timeframes: [date,time,month,quarter,year]
    sql: ${TABLE}.ContactDate ;;
  }

  dimension_group: inspection_date {
    view_label: "Claim Dates"
    label: "05 Inspection"
    type: time
    timeframes: [date,time,month,quarter,year]
    sql: ${TABLE}.InspectionDate ;;
  }

  dimension_group: first_report_date {
    view_label: "Claim Dates"
    label: "06 First Report"
    type: time
    timeframes: [date,time,month,quarter,year]
    sql: ${TABLE}.FirstReportDate ;;
  }

  dimension_group: adjustment_completed_date {
    view_label: "Claim Dates"
    label: "07 Adjustment Completion"
    type: time
    timeframes: [date,time,month,quarter,year]
    sql: ${TABLE}.AdjCompleteDate ;;
  }

  dimension_group: first_close_date {
    view_label: "Claim Dates"
    label: "08 Close (First)"
    type: time
    timeframes: [date,time,month,quarter,year]
    sql: ${TABLE}.FirstCloseDate ;;
  }

  dimension_group: re_open_date {
    view_label: "Claim Dates"
    label: "09 Re-open (Last)"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.ReOpenDate ;;
  }

  dimension_group: closed_date {
    view_label: "Claim Dates"
    label: "10 Closed (Last)"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.ClosedDate ;;
  }

  dimension_group: due_date {
    view_label: "Claim Dates"
    label: "Due"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.DueDate ;;
  }

  ###############
  ##  DATEDIFF ##
  ###############

  dimension: datediff_recevied_to_assigned {
    hidden: yes
    view_label: "Claim Dates"
    label: "20 Received to Assigned"
    type: number
    #sql: datediff(day, ${received_date_date}, ${assigned_date_date}) ;;
    sql: case when isnull(${accepted_date_time}, '1900-01-01') != '1900-01-01'
            then  (cast((datediff(minute,${received_date_time},${assigned_date_time})/60.) as decimal(12,2))/24)
            else 0
          end;;
    value_format_name: decimal_4
  }

  dimension: datediff_assigned_to_contact {
    hidden: yes
    view_label: "Claim Dates"
    label: "Assigned to First Contact"
    type: number
    #sql: datediff(day, ${received_date_date}, ${assigned_date_date}) ;;
    sql: case when isnull(${contact_date_time}, '1900-01-01') != '1900-01-01'
            then  (cast((datediff(minute,${assigned_date_time},${contact_date_time})/60.) as decimal(12,2))/24)
            else 0
          end;;
    value_format_name: decimal_2
  }

  dimension: datediff_assigned_to_accepted {
    hidden: yes
    view_label: "Claim Dates"
    label: "21 Assigned to Accepted"
    type: number
    sql: datediff(day, ${assigned_date_date}, ${accepted_date_date}) ;;
    value_format_name: decimal_0
  }

  dimension: datediff_accepted_to_contact {
    hidden: yes
    view_label: "Claim Dates"
    label: "22 Accepted to Contact"
    type: number
    sql: datediff(day, ${accepted_date_date}, ${contact_date_date}) ;;
    value_format_name: decimal_0
  }

  dimension: datediff_contact_to_inspection {
    hidden: yes
    view_label: "Claim Dates"
    label: "23 Contact to Inspection"
    type: number
    sql: datediff(day, ${contact_date_date}, ${inspection_date_date}) ;;
    value_format_name: decimal_0
  }

  dimension: datediff_inspection_to_first_report {
    hidden: yes
    view_label: "Claim Dates"
    label: "24 Inspection to First Report"
    type: number
    sql: datediff(day, ${inspection_date_date}, ${first_close_date_date}) ;;
    value_format_name: decimal_0
  }

  dimension: datediff_first_report_to_complete {
    hidden: yes
    view_label: "Claim Dates"
    label: "25 First Report to Complete"
    type: number
    sql: datediff(day, ${first_close_date_date}, ${adjustment_completed_date_date}) ;;
    value_format_name: decimal_0
  }

  dimension: datediff_first_complete_to_first_close {
    hidden: yes
    view_label: "Claim Dates"
    label: "26 Complete to First Close"
    type: number
    sql: datediff(day, ${adjustment_completed_date_date}, ${first_close_date_date}) ;;
    value_format_name: decimal_0
  }

  dimension: datediff_first_close_to_reopen {
    hidden: yes
    view_label: "Claim Dates"
    label: "27 First Close to ReOpen"
    type: number
    sql: datediff(day, ${first_close_date_date}, ${re_open_date_date}) ;;
    value_format_name: decimal_0
  }


  ###############
  ##  AVERAGE  ##
  ###############


  measure: average_recevied_to_assigned {
    view_label: "Claim Dates"
    label: "30 Ave Received to Assigned"
    type: average
    sql: ${datediff_recevied_to_assigned} ;;
    value_format_name: decimal_1
    filters: {
      field: assigned_date_date
      value: "-NULL"
    }
    filters: {
      field: received_date_date
      value: "-NULL"
    }
  }

  #   dimension: datediff_assigned_to_accepted {
#     view_label: "Claim Dates"
#     label: "21 Assigned to Accepted"
#     type: number
#     sql: datediff(day, ${assigned_date_date}, ${accepted_date_date}) ;;
#     value_format_name: decimal_0
#   }



  ############
  ##  TIME  ##
  ############

  dimension: time_to_assign {
    label: "Time to Assign"
    type: number
    sql: ${TABLE}.TimeToAssign ;;
  }

  dimension: time_to_accept {
    label: "Time to Accept"
    type: number
    sql: ${TABLE}.TimeToAccept ;;
  }

  dimension: time_to_contact {
    label: "Time to Contact"
    type: number
    sql: ${TABLE}.TimeToContact ;;
  }

  dimension: time_to_inspect {
    label: "Time to Inspect"
    type: number
    sql: ${TABLE}.TimeToInspect ;;
  }

  dimension: time_to_first_report {
    label: "Time to First Report"
    type: number
    sql: ${TABLE}.TimeToFirstReport ;;
  }

  dimension: time_to_complete {
    label: "Time to Complete"
    type: number
    sql: ${TABLE}.TimeToComplete ;;
  }

  dimension: time_allocated {
    label: "Time Allocated"
    type: number
    sql: ${TABLE}.TimeAllocated ;;
  }


  ################
  ##  DURATION  ##
  ################

  dimension: duration_to_assign {
    label: "1 Duration to Assign"
    type: number
    sql: ${TABLE}.DurationToAssign ;;
    value_format_name: decimal_4
  }

  dimension: duration_to_accept {
    label: "2 Duration to Accept"
    type: number
    sql: ${TABLE}.DurationToAccept ;;
    value_format_name: decimal_4
  }

  dimension: duration_to_contact {
    label: "3 Duration to Contact"
    type: number
    sql: ${TABLE}.DurationToContact ;;
    value_format_name: decimal_4
  }

  dimension: duration_to_inspect {
    label: "4 Duration to Inspect"
    type: number
    sql: ${TABLE}.DurationToInspect ;;
    value_format_name: decimal_4
  }

  dimension: duration_to_first_report {
    label: "5 Duration to First Report"
    type: number
    sql: ${TABLE}.DurationToFirstReport ;;
    value_format_name: decimal_4
  }

  dimension: duration_to_adjust {
    label: "6 Duration to Adjust"
    type: number
    sql: ${TABLE}.DurationToAdjust ;;
    value_format_name: decimal_4
  }

  dimension: duration_allocated {
    label: "9 Duration Allocated"
    type: number
    sql: ${TABLE}.DurationAllocated ;;
    value_format_name: decimal_4
  }

  dimension: duration_to_first_close {
    label: "7 Duration to First Close"
    type: number
    sql: ${TABLE}.DurationToFirstClose ;;
    value_format_name: decimal_4
  }

  dimension: hours_since_last_update {
    label: "Hours Since Last Update"
    type: number
    sql: ${TABLE}.HoursSinceLastUpdate ;;
    value_format_name: decimal_4
  }

  ########################
  ##  AVERAGE DURATION  ##
  ########################

  measure: ave_assigned_to_contact {
    view_label: "Claim Dates"
    label: "Average Duration To 1st Contact"
    type: average
    sql: ${datediff_assigned_to_contact} ;;
    value_format_name: decimal_2
    filters: {
      field: contact_date_date
      value: "-NULL"
    }
    filters: {
      field: datediff_assigned_to_contact
      value: ">0"
    }
    drill_fields: [dm_claim.dates_drill*]
  }

  ########################
  ##                    ##
  ########################

  dimension: days_open {
    hidden: yes
    view_label: "Claim"
    label: "First Days Open"
    type: number
    sql: case when trim(${dm_claim.claim_closed})='No'
          then DATEDIFF(dd, ${received_date_date}, GetDate())
          else DATEDIFF(dd, ${received_date_date}, ${closed_date_date}) end  ;;
      #--case when ${first_close_date_date} IS NULL
    }

    dimension : days_open_tier {
      view_label: "Claim"
      label: "Days Open (Tiers)"
      type: tier
      tiers: [31,61,91]
      style: integer
      sql: ${days_open} ;;
      value_format: "0"
    }

  }
