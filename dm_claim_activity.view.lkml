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

  ############
  ##  DATE  ##
  ############

  dimension_group: claim_date_received {
    label: "Claim Received"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.ClaimDateReceived ;;
  }

  dimension_group: assigned_date {
    label: "Assigned"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.AssignedDate ;;
  }

  dimension_group: accepted_date {
    label: "Accepted"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.AcceptedDate ;;
  }

  dimension_group: due_date {
    label: "Due"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.DueDate ;;
  }

  dimension_group: first_report_date {
    label: "First Reported"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.FirstReportDate ;;
  }

  dimension_group: adjustment_completed_date {
    label: "Adjustment Completion"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.AdjustmentCompletedDate ;;
  }

  dimension_group: re_open_date {
    label: "Re-open"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.ReOpenDate ;;
  }

  dimension_group: closed_date {
    label: "Closed"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.ClosedDate ;;
  }

  dimension_group: date_of_contact {
    label: "Contact"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.DateOfContact ;;
  }

  dimension_group: date_of_inspection {
    label: "Inspection"
    type: time
    timeframes: [date,month,quarter,year]
    sql: ${TABLE}.DateOfInspection ;;
  }


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
    label: "Duration to Assign"
    type: number
    sql: ${TABLE}.DurationToAssign ;;
    value_format_name: decimal_4
  }

  dimension: duration_to_accept {
    label: "Duration to Accept"
    type: number
    sql: ${TABLE}.DurationToAccept ;;
    value_format_name: decimal_4
  }

  dimension: duration_to_contact {
    label: "Duration to Contact"
    type: number
    sql: ${TABLE}.DurationToContact ;;
    value_format_name: decimal_4
  }

  dimension: duration_to_inspect {
    label: "Duration to Inspect"
    type: number
    sql: ${TABLE}.DurationToInspect ;;
    value_format_name: decimal_4
  }

  dimension: duration_to_first_report {
    label: "Duration to First Report"
    type: number
    sql: ${TABLE}.DurationToFirstReport ;;
    value_format_name: decimal_4
  }

  dimension: duration_to_adjust {
    label: "Duration to Adjust"
    type: number
    sql: ${TABLE}.DurationToAdjust ;;
    value_format_name: decimal_4
  }

  dimension: duration_allocated {
    label: "Duration Allocated"
    type: number
    sql: ${TABLE}.DurationAllocated ;;
    value_format_name: decimal_4
  }

  dimension: hours_since_last_update {
    label: "Hours Since Last Update"
    type: number
    sql: ${TABLE}.HoursSinceLastUpdate ;;
    value_format_name: decimal_4
  }

  #   measure: count {
#     type: count
#     drill_fields: [id]
#   }
}
