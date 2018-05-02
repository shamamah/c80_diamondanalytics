view: c57_average_severity_for_paid_claim {
    label: "Average Severity For Paid Claims"
    derived_table: {
      sql:
        SELECT   Age
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
                                             Age integer
                                            ,Reported varchar(250)
                                            ,closed varchar(250)
                                            ,claimcontrol_id varchar(250)
                                            ,claim_number varchar(250)
                                            ,claimfeature_num varchar(250)
                                            ,claimant_num varchar(250)
                                            ,cov varchar(250)
                                            ,loss_paid float
                                            ,loss_paid_AllIn float
                                            ,loss_OS float
                                            ,loss_OS_AllIn float
                                            ,alae_paid float
                                            ,alae_paid_AllIn float
                                            ,exp_paid float
                                            ,exp_paid_AllIn float
                                          ))')
       ;;
    }

  dimension: compound_primary_key {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${claimcontrol_id}, '  ', ${claimant_num},'  ', ${claimfeature_num}) ;;
  }

  dimension: Age {
    label: "Age"
    type: tier
    style: integer
    tiers: [0, 91, 181, 271, 361]
    sql: ${TABLE}.Age ;;
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

  measure: loss_paid {
    type: sum
    value_format_name: usd
    label: "Loss Paid"
    sql: ${TABLE}.loss_paid ;;
  }

  measure: loss_paid_allin {
    type: sum
    value_format_name: usd
    label: "Loss Paid All-In"
    sql: ${TABLE}.loss_paid_allin ;;
  }

  measure: loss_OS {
    type: sum
    value_format_name: usd
    label: "Loss Outstanding"
    sql: ${TABLE}.loss_OS ;;
  }

  measure: loss_OS_allin {
    type: sum
    value_format_name: usd
    label: "Loss Outstanding All-In"
    sql: ${TABLE}.loss_OS_allin ;;
  }

  measure: alae_paid {
    type: sum
    value_format_name: usd
    label: "ALAE Paid"
    sql: ${TABLE}.alae_paid ;;
  }

  measure: alae_paid_allin {
    type: sum
    value_format_name: usd
    label: "ALAE Paid All-In"
    sql: ${TABLE}.alae_paid_allin ;;
  }

  measure: exp_paid {
    type: sum
    value_format_name: usd
    label: "Expense Paid"
    sql: ${TABLE}.exp_paid ;;
  }

  measure: exp_paid_allin {
    type: sum
    value_format_name: usd
    label: "Expense Paid All-In"
    sql: ${TABLE}.exp_paid_allin ;;
  }

  measure: count {
    type: count
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
