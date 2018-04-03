view: c57_average_severity_for_paid_claim {
    view_label: "Average Severity For Paid Claims - By Aging Bucket / By Coverage"
    derived_table: {
      sql:
        SELECT   sortord
                ,GroupName
                ,Reported
                ,closed
                ,claimcontrol_id
                ,claim_number
                ,claimfeature_num
                ,claimant_num
                ,cov
                ,loss_paid
                ,loss_paid_AllIn
                ,loss_OS
                ,loss_OS_AllIn
                ,alae_paid
                ,alae_paid_AllIn
                ,exp_paid
                ,exp_paid_AllIn
        FROM OPENQUERY([AL-LookerSQL], 'EXEC C57_Diamond.dbo.assp_C57_Looker_AverageSeverityForPaidClaim @start_date = '{% parameter start_date %}', @end_date = '{% parameter start_date %}' WITH RESULT SETS ((
                                            sortord varchar(250)
                                            ,GroupName varchar(250)
                                            ,Reported varchar(250)
                                            ,closed varchar(250)
                                            ,claimcontrol_id varchar(250)
                                            ,claim_number varchar(250)
                                            ,claimfeature_num varchar(250)
                                            ,claimant_num varchar(250)
                                            ,cov varchar(250)
                                            ,loss_paid varchar(250)
                                            ,loss_paid_AllIn varchar(250)
                                            ,loss_OS varchar(250)
                                            ,loss_OS_AllIn varchar(250)
                                            ,alae_paid varchar(250)
                                            ,alae_paid_AllIn varchar(250)
                                            ,exp_paid varchar(250)
                                            ,exp_paid_AllIn varchar(250)
                                          ))')
       ;;
    }

  dimension: sortord {
    type: number
    label: "Sort Order"
    sql: ${TABLE}.sortord ;;
  }

  dimension: GroupName {
    type: string
    label: "Group Name"
    sql: ${TABLE}.GroupName ;;
  }

  dimension: Reported {
    type: date
    label: "Reported Date"
    sql: ${TABLE}.reported ;;
  }

  dimension: Closed {
    type: date
    label: "Closed Date"
    sql: ${TABLE}.closed ;;
  }

  dimension: claimcontrol_id {
    type: number
    label: "Claim Control ID"
    sql: ${TABLE}.claimcontrol_id ;;
  }

  dimension: claim_number {
    type: string
    label: "Claim Number"
    sql: ${TABLE}.claim_number ;;
  }

  dimension: claimfeature_num {
    type: number
    label: "Claim Feature Number"
    sql: ${TABLE}.claimfeature_num ;;
  }

  dimension: claimant_num {
    type: number
    label: "Claimant Number"
    sql: ${TABLE}.claimant_num ;;
  }

  dimension: coverage_description {
    type: string
    label: "Coverage Description"
    sql: ${TABLE}.cov ;;
  }

  dimension: loss_paid {
    type: number
    value_format_name: usd
    label: "Loss Paid"
    sql: ${TABLE}.loss_paid ;;
  }

  dimension: loss_paid_allin {
    type: number
    value_format_name: usd
    label: "Loss Paid All-In"
    sql: ${TABLE}.loss_paid_allin ;;
  }

  dimension: loss_OS {
    type: number
    value_format_name: usd
    label: "Loss OS"
    sql: ${TABLE}.loss_OS ;;
  }

  dimension: loss_OS_allin {
    type: number
    value_format_name: usd
    label: "Loss OS All-In"
    sql: ${TABLE}.loss_OS_allin ;;
  }

  dimension: alae_paid {
    type: number
    value_format_name: usd
    label: "ALAE Paid"
    sql: ${TABLE}.alae_paid ;;
  }

  dimension: alae_paid_allin {
    type: number
    value_format_name: usd
    label: "ALAE Paid All-In"
    sql: ${TABLE}.alae_paid_allin ;;
  }

  dimension: exp_paid {
    type: number
    value_format_name: usd
    label: "Expense Paid"
    sql: ${TABLE}.exp_paid ;;
  }

  dimension: exp_paid_allin {
    type: number
    value_format_name: usd
    label: "Expense Paid All-In"
    sql: ${TABLE}.exp_paid_allin ;;
  }

  filter: start_date {
    type: string
    label: "Start Date"
  }

  filter: end_date {
    type: string
    label: "End Date"
  }


  }
